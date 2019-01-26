import UIKit
import AVKit


class InterestsViewController: UIViewController
{
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var WordButton: UIButton!
    
    var answers = Answer.fetchAnswers()
    
    
    let cellScaling: CGFloat = 0.6
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        answers = Answer.fetchAnswers()
        WordButton.setTitle(Datas.Words.RealAnswerIs.eng, for: .normal)
        self.WordButton(self.WordButton)
        Datas.Words.SelectedAnswerIs.rus = answers[0].text
        
        let screenSize = UIScreen.main.bounds.size
        let cellWidth = floor(screenSize.width * cellScaling)
        let cellHeight = floor(screenSize.height * cellScaling)
        
        let insetX = (view.bounds.width - cellWidth) / 2.0
        let insetY = (view.bounds.height - cellHeight) / 2.0
        
        let layout = collectionView!.collectionViewLayout as! UICollectionViewFlowLayout
        layout.itemSize = CGSize(width: cellWidth, height: cellHeight)
        collectionView?.contentInset = UIEdgeInsets(top: insetY, left: insetX, bottom: insetY, right: insetX)
        
        collectionView?.dataSource = self
        collectionView?.delegate = self
    }
    
    @IBAction func DontNowButton(_ sender: UIButton) {
        answers = Answer.fetchAnswers()
        WordButton.setTitle(Datas.Words.RealAnswerIs.eng, for: .normal)
        self.WordButton(self.WordButton)
        Datas.Words.SelectedAnswerIs.rus = answers[0].text
        
        collectionView.performBatchUpdates({
            let indexSet = IndexSet(integersIn: 0...0)
            collectionView.reloadSections(indexSet)
        }, completion: nil)
        
            Datas.Words.SelectedAnswerIs.rus = answers[Datas.Words.SelectedAnswerIs.showedIndex].text
    }
    
    @IBAction func WordButton(_ sender: UIButton) {
        let synthesizer = AVSpeechSynthesizer()
        let string = WordButton.currentTitle
        let utterance = AVSpeechUtterance(string: string!)
        utterance.voice = AVSpeechSynthesisVoice(language: "en-GB")
        synthesizer.speak(utterance)
    }
    
    @IBAction func CheckMe(_ sender: UIButton) {
        var string = ""
        print("Ответ выбран=\(Datas.Words.SelectedAnswerIs.rus), а на самом деле=\(Datas.Words.RealAnswerIs.rus)")
        if Datas.Words.SelectedAnswerIs.rus == Datas.Words.RealAnswerIs.rus {
            string = "Ты - умница!"
        } else {
            string = "Айяйййй.  Ошиблась!!"
        }
        let synthesizer = AVSpeechSynthesizer()
        let utterance = AVSpeechUtterance(string: string)
        utterance.voice = AVSpeechSynthesisVoice(language: "ru-RU")
        synthesizer.speak(utterance)
        
        // wait until end
        
        //        while synthesizer.isSpeaking {
        //            print("STILL SPEAKING!")
        //
        //        }
        usleep(3000000)
        
        if Datas.Words.SelectedAnswerIs.rus == Datas.Words.RealAnswerIs.rus {
            answers = Answer.fetchAnswers()
            WordButton.setTitle(Datas.Words.RealAnswerIs.eng, for: .normal)
            Datas.Words.SelectedAnswerIs.rus = answers[Datas.Words.SelectedAnswerIs.curIndex].text
            
            collectionView.performBatchUpdates({
                let indexSet = IndexSet(integersIn: 0...0)
                collectionView.reloadSections(indexSet)
            }, completion: nil)
            self.WordButton(self.WordButton)
            
            Datas.Words.SelectedAnswerIs.rus = answers[Datas.Words.SelectedAnswerIs.showedIndex].text
           print("showedIndex answ =\(Datas.Words.SelectedAnswerIs.showedIndex)  \(answers[Datas.Words.SelectedAnswerIs.showedIndex].text)")
        }
        
    }
    
    @IBAction func HomeButton(_ sender: UIButton) {
    dismiss(animated: true, completion: nil)
    
    }
    
}

extension InterestsViewController : UICollectionViewDataSource
{
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return answers.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell
    {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "InterestCell", for: indexPath) as! InterestCollectionViewCell
        cell.answer = answers[indexPath.item]
        return cell
    }
    
    
}

extension InterestsViewController : UIScrollViewDelegate, UICollectionViewDelegate
{
    func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>)
    {
        let layout = self.collectionView?.collectionViewLayout as! UICollectionViewFlowLayout
        let cellWidthIncludingSpacing = layout.itemSize.width + layout.minimumLineSpacing
        
        var offset = targetContentOffset.pointee
        let index = (offset.x + scrollView.contentInset.left) / cellWidthIncludingSpacing
        let roundedIndex = round(index)
        
        offset = CGPoint(x: roundedIndex * cellWidthIncludingSpacing - scrollView.contentInset.left, y: -scrollView.contentInset.top)
        targetContentOffset.pointee = offset
        
        Datas.Words.SelectedAnswerIs.rus = answers[Int(roundedIndex)].text
        Datas.Words.SelectedAnswerIs.curIndex = Int(roundedIndex)
        print("cur1=\(roundedIndex)  \(answers[Int(roundedIndex)].text)")
        Datas.Words.SelectedAnswerIs.showedIndex = Int(roundedIndex)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let synthesizer = AVSpeechSynthesizer()
        let string = answers[indexPath.item].text
        let utterance = AVSpeechUtterance(string: string)
        utterance.voice = AVSpeechSynthesisVoice(language: "ru-RU")
        synthesizer.speak(utterance)
        
        Datas.Words.SelectedAnswerIs.rus = answers[indexPath.item].text
        Datas.Words.SelectedAnswerIs.curIndex = indexPath.item
        print("cur2=\(indexPath.item)  \(answers[indexPath.item].text)")
    }

}



















