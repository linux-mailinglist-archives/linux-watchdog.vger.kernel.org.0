Return-Path: <linux-watchdog+bounces-750-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5937986D1CB
	for <lists+linux-watchdog@lfdr.de>; Thu, 29 Feb 2024 19:15:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C35271F264C4
	for <lists+linux-watchdog@lfdr.de>; Thu, 29 Feb 2024 18:15:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D1D4F12FB0B;
	Thu, 29 Feb 2024 18:13:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=squebb.ca header.i=@squebb.ca header.b="sq4tK3HV";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="Dmdxyr/H"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from fhigh7-smtp.messagingengine.com (fhigh7-smtp.messagingengine.com [103.168.172.158])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F346B1361B0;
	Thu, 29 Feb 2024 18:13:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.158
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709230403; cv=none; b=KJIzXcAAeZjBgm3byb8Vnd9WQ88rVbNbr7jxNQP5CEt9z9a+YWlni1EIcXdwRpE8s1MBMMY7mKyq+7Ul2rYSeDWu826/3UiEr+vliWfGHaU6DAzr6ks10zj4tqFabMmoioaMSG3fU52MTsPX06EWN/iGdHKqNw5vlwLMMASLsB4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709230403; c=relaxed/simple;
	bh=ZevAuP8YOPWkq2ddqBy0t7lI4waUdZKShI97uElAdK0=;
	h=MIME-Version:Message-Id:In-Reply-To:References:Date:From:To:Cc:
	 Subject:Content-Type; b=MhzcV21dIUDlr7FjJkzpfBOdYQF5uFUjf1Py74pysiw3gwmny7YX0VHHewVwJlc41pVzXhhC0mAZo+a+6siTwIy5Ad8eg2vK9dt7Hb9HakjqLeJ8qu3ycZc3VYIvYBAzihDJrCs89spQt+UV9ZTmgRg6zyvW9YAS0ShadyMG4ww=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=squebb.ca; spf=pass smtp.mailfrom=squebb.ca; dkim=pass (2048-bit key) header.d=squebb.ca header.i=@squebb.ca header.b=sq4tK3HV; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=Dmdxyr/H; arc=none smtp.client-ip=103.168.172.158
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=squebb.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=squebb.ca
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
	by mailfhigh.nyi.internal (Postfix) with ESMTP id 1643B114013F;
	Thu, 29 Feb 2024 13:13:20 -0500 (EST)
Received: from imap52 ([10.202.2.102])
  by compute3.internal (MEProxy); Thu, 29 Feb 2024 13:13:20 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=squebb.ca; h=cc
	:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm2; t=1709230400; x=1709316800; bh=J4b8McD7oz
	UI3KvWTW5XBkPmfDzSKvnU9liWzQGIZj4=; b=sq4tK3HVoEj5CrhgfYRSyJgEzn
	Xibgx122VpQs0Hx+vakizTPWKu3/NLWAnknaPtH0o3keLKl/tqCg9x5FHllBrIhB
	yT/guNyJbxgvBLI9PiSDKUYeDg4EgKBcdRH10+Z7tDbQAu8Wbn/KCL48pE/DDMiV
	530tr0GCI1yIUBsf9CPA0K3KCFyASYMXVVPH1bOhFWzytYe8iy6znICIHn2++1qT
	6qNjvdJFh9DXUMGWw4jL/Zj4pQYLn8dfiN7d+RPbtq+LrGVgaaZFcSodjJG56KWZ
	GOnMKdDQnPr6YeZ/uVVn8fkJ5VMc9QtRtuc7IQSWKjZRpaZdgzoZKjPTCykQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm1; t=1709230400; x=1709316800; bh=J4b8McD7ozUI3KvWTW5XBkPmfDzS
	KvnU9liWzQGIZj4=; b=Dmdxyr/H8xIkB+L+XmYO4pywn6gvbxfeHDcTUOMfsU61
	gQQvehfY17AwgDcmxq6/eszSkDM38rN9qCWpSEdNZ+rFJRr39GXlB5bRQpfRdbQo
	7odYtMilRfUKA4N2p00KZRfm9FuFtQ1msNVagms3RcYX/aVepcxA3mLvumsQGmy9
	1w2R89PVhClPmhuNmiaaDzfoj18Lm2nRs5atnjo0+BlQC/pFfyR+PPQ18wES7jds
	qr1bwDqmTx8hZD59rZ+XXuis55Nd096P697IoMMtur2y6pFuAXP5OJ78KPV/SFo4
	yihS13pnjva6rNUpqKr+xKv7Mg1+tjMcM2s2TYXSMA==
X-ME-Sender: <xms:PsngZZWLijorkNhDEzMvEtMaSrN37oMVQ1lYa7EmSnBddjmaSkdO5A>
    <xme:PsngZZlot5HyFwJsQz3TjSv2EkEt5dZNzCutBJ15KR1lSh0Ov748HAuP_5vqf6yB3
    V5LMZ8ZGyY8RoyFeZ8>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvledrgeelgddutdekucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepofgfggfkjghffffhvfevufgtsehttdertderredtnecuhfhrohhmpedfofgr
    rhhkucfrvggrrhhsohhnfdcuoehmphgvrghrshhonhesshhquhgvsggsrdgtrgeqnecugg
    ftrfgrthhtvghrnhepueevffdtfeejveevjeehhefhveefleffheefgfehffejtedvvdfh
    udffgeehfeeinecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrh
    homhepmhhpvggrrhhsohhnsehsqhhuvggssgdrtggr
X-ME-Proxy: <xmx:PsngZVZXfeX5nOw-wlk7YYZqxKn9Q8sq43Kzlob4Xc4wFIvetCB1kA>
    <xmx:PsngZcXfAK8QEzln-_arorZ5wRZoJm590dtQJMdqVM5eonTyd3N_2w>
    <xmx:PsngZTkJSqjiKrreH_9PxulRuvZgyQEih4ISxOKiL8hrpPgbIijp2Q>
    <xmx:QMngZetVqjnyesHT7KkyI5SktPbMgJ_H7iBWumlMlSh4uVwCdzPAjQ>
Feedback-ID: ic2b14614:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id 90C53C60097; Thu, 29 Feb 2024 13:13:18 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.11.0-alpha0-204-gba07d63ee1-fm-20240229.003-gba07d63e
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-Id: <6c97c63b-af35-4919-b5a2-a867776be8e9@app.fastmail.com>
In-Reply-To: <6066862c-cad6-4845-8e90-32d4572c7a23@roeck-us.net>
References: <20230721122931.505957-1-dober6023@gmail.com>
 <a361ce91-beba-43d8-b969-285063658da5@app.fastmail.com>
 <6b0373a2-7750-4d57-8839-95c6fa30c6b8@roeck-us.net>
 <4209014c-1730-4c31-87d8-4192d68bcbc6@app.fastmail.com>
 <6615ab2a-3267-477c-ad1b-a72d5a4244e0@roeck-us.net>
 <412acdd3-6b1f-4c45-966f-c493b6fc3ddf@app.fastmail.com>
 <42a7e7e9-01b0-4d41-8af1-328de90934ef@roeck-us.net>
 <74a39cd0-cee3-49a2-a47b-92a9cf9ca008@app.fastmail.com>
 <45490a63-e46a-4eb3-a55d-2e2642588ccd@app.fastmail.com>
 <6066862c-cad6-4845-8e90-32d4572c7a23@roeck-us.net>
Date: Thu, 29 Feb 2024 13:12:12 -0500
From: "Mark Pearson" <mpearson@squebb.ca>
To: "Guenter Roeck" <linux@roeck-us.net>, "David Ober" <dober6023@gmail.com>,
 wim@linux-watchdog.org
Cc: linux-kernel@vger.kernel.org, linux-watchdog@vger.kernel.org,
 "David Ober" <dober@lenovo.com>
Subject: Re: [PATCH v3] Watchdog: New module for ITE 5632 watchdog
Content-Type: text/plain

Hi Guenter

On Thu, Feb 29, 2024, at 12:25 PM, Guenter Roeck wrote:
> On 2/29/24 08:40, Mark Pearson wrote:
>> Hi Guenter,
>> 
>> On Mon, Feb 26, 2024, at 11:23 AM, Mark Pearson wrote:
>>> Thanks!
>>>
>>> On Sun, Feb 25, 2024, at 1:43 AM, Guenter Roeck wrote:
>>>> On 2/24/24 12:19, Mark Pearson wrote:
>>>>> Thanks Guenter,
>>>>>
>>>>> On Sat, Feb 24, 2024, at 10:49 AM, Guenter Roeck wrote:
>>>>>> On 2/23/24 16:43, Mark Pearson wrote:
>>>>>>> Thanks Guenter
>>>>>>>
>>>>>>> On Fri, Feb 23, 2024, at 3:21 PM, Guenter Roeck wrote:
>>>>>>>> On 2/23/24 11:58, Mark Pearson wrote:
>>>>>>>>> On Fri, Jul 21, 2023, at 8:29 AM, David Ober wrote:
>>>>>>>>>> This modules is to allow for the new ITE 5632 EC chip
>>>>>>>>>> to support the watchdog for initial use in the Lenovo SE10
>>>>>>>>>>
>>>>>>>>>> Signed-off-by: David Ober <dober6023@gmail.com>
>>>>>>>>>>
>>>>>>>>>> V2 Fix stop to deactivate wdog on unload of module
>>>>>>>>>> V2 Remove extra logging that is not needed
>>>>>>>>>> V2 change udelays to usleep_range
>>>>>>>>>> V2 Changed to now request region on start and release on stop instead
>>>>>>>>>>        of for every ping and read/write
>>>>>>>>>> V3 add counter to while loops so it will not hang
>>>>>>>>>> V3 rework code to use platform_device_register_simple
>>>>>>>>>> V3 rework getting the Chip ID to remove duplicate code and close IO
>>>>>>>>>> V3 change some extra logging to be debug only
>>>>>>>>>> ---
>>>>>>>> [ ... ]
>>>>>>>>>> +config ITE5632_WDT
>>>>>>>>>> +        tristate "ITE 5632"
>>>>>>>>>> +        select WATCHDOG_CORE
>>>>>>>>>> +        help
>>>>>>>>>> +          If you say yes here you get support for the watchdog
>>>>>>>>>> +          functionality of the ITE 5632 eSIO chip.
>>>>>>>>>> +
>>>>>>>>>> +          This driver can also be built as a module. If so, the module
>>>>>>>>>> +          will be called ite5632_wdt.
>>>>>>>>>> +
>>>>>>>>
>>>>>>>> [ ... ]
>>>>>>>>
>>>>>>>>>
>>>>>>>>>
>>>>>>>>> Please let us know if there is anything else needed to get this accepted. Happy to address any feedback.
>>>>>>>>>
>>>>>>>>
>>>>>>>> I am sure I commented on this before. The fact that the Lenovo SE10 uses an
>>>>>>>> ITE 5632 controller is completely irrelevant. Lenovo could decide tomorrow to
>>>>>>>> replace the ITE chip with a Nuvoton chip, use the same API to talk with it,
>>>>>>>> and the watchdog would work perfectly fine.
>>>>>>>>
>>>>>>>> This is a driver for the watchdog implemented in the embedded controller
>>>>>>>> on Lenovo SE10. It is not a watchdog driver for ITE5632. Again, the EC chip
>>>>>>>> used in that Lenovo system is completely irrelevant, even more so since
>>>>>>>> this seems to be one of those undocumented ITE chips which officially
>>>>>>>> don't even exist. Claiming that this would be a watchdog driver for ITE5632
>>>>>>>> would be not only misleading but simply wrong.
>>>>>>>>
>>>>>>>> It seems that we can not agree on this. That means that, from my perspective,
>>>>>>>> there is no real path to move forward. Wim will have to decide if and how
>>>>>>>> to proceed.
>>>>>>>>
>>>>>>> My apologies - I hadn't realised that was the issue (my fault for missing it). Appreciate the clarification.
>>>>>>>
>>>>>>> Is this as simple as renaming this driver as (for example) a lenovo_se_wdt device, and adding in the appropriate checking during the init that it is only used on Lenovo SE10 platforms?
>>>>>>>
>>>>>>
>>>>>> There would have to be additional changes. For example, the driver does not
>>>>>> return errors if its wait loops time out, and it doesn't reserve the IO address
>>>>>> range used by the chip. Tying the wait time to the number of wait loops
>>>>>> and not to the elapsed time is also something that would need to be explained.
>>>>>>
>>>>> Ack - we can look at those. Thanks for the feedback.
>>>>>
>>>>>> Also, I notice that the communication is similar to the communication with
>>>>>> Super-IO chips from ITE, but not the same. Specifically, the unlock key is
>>>>>> the same, but the lock key is different. This means that the code may unlock
>>>>>> other chips from ITE in a given system, but not lock them. Some of those chips
>>>>>> are ... let's call it less then perfect. They will act oddly on the bus if left
>>>>>> unlocked. Some of those chips will act oddly if an attempt is made to lock them
>>>>>> after unlocking them, and they have to remain unlocked to avoid corrupting
>>>>>> communication with other chips on the same bus. The impact on other chips
>>>>>> from the same vendor will have to be explored further.
>>>>>
>>>>> Afraid I'm still missing something here. If we make it so this driver is only used on the SE10 platform, then does that remove the concern? At that point it's specific to that HW platform and no HW changes are planned.
>>>>
>>>> Yes.
>>>>
>>>>> Agreed that having this available generically is not a good idea.
>>>>>
>>>>>>
>>>>>>> I don't understand the concern if a different chip was used - wouldn't that need a different driver at that point?
>>>>>>>
>>>>>>
>>>>>> Why would that be the case ?
>>>>>>
>>>>>> Maybe I am missing something essential. If you insist to tie this driver to the
>>>>>> ITE5632 and not to the system, you will have to provide additional information.
>>>>>
>>>>> I'm in agreement we should tie this to the platform - we'll make that change. No insistence implied :)
>>>>>
>>>>>> The chip does not even exist in public, so no one but you and ITE really knows
>>>>>> what its capabilities are. Is this is a chip which is used, or is going to be
>>>>>> used, in a variety of systems, possibly including systems from other vendors ?
>>>>>> Is the communication between main CPU and the chip tied to the chip and will/may
>>>>>> only be used with this chip or variants of it ? Is the ITE5632 a SuperIO-like
>>>>>> chip with fixed capabilities, or is it a programmed micro-controller ?
>>>>>>
>>>>>
>>>>> Afraid I don't understand the point about the chip not existing in public - do you just mean publicly available datasheets? At the risk of being repetitive, if this driver is locked to the Lenovo SE10 platform does that address the concerns?
>>>>>
>>>>
>>>> Just try to find information about this chip anywhere. The only
>>>> evidence that the
>>>> chip even exists appears to be this submission.
>>>>
>>>>>> To a large degree all that is due to ITE and its customers not
>>>>>> providing information
>>>>>> about their chips to the public. Due to that lack of information, my
>>>>>> assumption was
>>>>>> that it is a programmed micro-controller. The code itself suggests,
>>>>>> through the
>>>>>> use of the term "EC" in the driver, that it is an embedded controller,
>>>>>> not a Suoer-IO
>>>>>> or other fixed-capability chip. If that is not the case, and if the
>>>>>> communication
>>>>>> with the chip is fixed and not programmable, you'll have to explain
>>>>>> that.
>>>>>
>>>>> Yeah, ack to that - and in that's something we need to address going forward in contracts we set for platforms that will have Linux support. I can't change what has already been done I'm afraid. We do have access, under NDA, to more details - but we're also limited in what we can disclose.
>>>>> I need to go look at the details for this again, with David, and see what we can do to address any questions; but there are going to be some limits I'm afraid and I'm hoping they aren't blockers.
>>>>
>>>> I can't say that I am surprised. It is quite common for chips from ITE.
>>>> Most of them seem to be custom builds made for specific customers/boards,
>>>> with little if any information available. People providing tools for Windows
>>>> can often sign NDAs with board vendors to get the information they need to
>>>> implement support in those tools. Unfortunately that isn't an option for
>>>> Linux kernel maintainers.
>>>>
>>>>> The aim is to get a driver working for this platform in shape enough to get accepted upstream and be useful.
>>>>>
>>>>>>
>>>>>> If it is an EC, the protocol is defined by its microcode, and the
>>>>>> driver needs
>>>>>> to be tied to the systems using that microcode. If it is a
>>>>>> fixed-capability chip,
>>>>>> the driver should not suggest that it communicates with an embedded
>>>>>> controller
>>>>>> but with a fixed-capability chip.
>>>>>>
>>>>>
>>>>> OK - we may also have used some incorrect terminology inadvertently, so I don't want to jump to too many conclusions. Will look into this.
>>>>>
>>>>> Thanks for the detailed notes - we weren't sure what had been missing from the driver since the last submission so it's helpful to know where improvements are needed.
>>>>> Appreciate the patience as this is a learning experience for us for this kernel sub-tree.
>>>>>
>>>> And I still have no idea if this an EC or not ;-). My best guess would
>>>> be that it is an NDS32 based micro-controller, related to IT5671.
>>>>
>>>> Of course, the next question would be if this chip has additional
>>>> functionality, such as hardware monitoring. I guess I'll see that
>>>> when I get a patch introducing its hwmon driver.
>>>>
>>> We believe it is only providing watchdog functionality, but we're
>>> double checking with the HW team to be sure.
>>>
>>> Afraid I don't have the details on what it is based on to be able to
>>> answer that.
>>>
>> 
>> I got some answers - and I was wrong. This device is capable of more than watchdog functionality. On this platform it does provide some temperature sensors (it could do fan control but the device is fanless so that's moot).
>> 
>> My understanding is this means the right way forward is to create a MFD driver. I played with this a bit, and think I understand what is involved - but wanted to check if there were any recommendations on the following plan:
>> 
>>   - Create a lenovo-think-mfd driver. We'd use this to probe the system (DMI) and then match it up with our platforms and use appropriate mfd_cells.
>>   - Initially we'd target the device on the SE10. We also have the watchdog driver for the SE30 (NCT6692D device) that I think may be a good candidate too.
>>   - Create a new lenovo-se10-wdt watchdog driver, that would be linked to the MFD driver.
>>   - (Once confirmed) do the same for the lenovo-se30-wdt driver.
>>   - I'm going to look at the temp sensors for the SE10, but don't plan on having that in the initial patchset. It's something we'd add at a later date.
>> 
>> If that's all logical - are there any preferences as to how these come in as commits?
>> I'm guessing one for the mfd driver, one for the SE10 watchdog, one for the SE30 watchdog?
>> Documentation would need to be updated as well.
>> Anything else that would be important?
>> 
>> Would appreciate if you can let me know if I'm missing anything or if I'm heading in the wrong direction.
>> 
>
> This summarizes pretty much what I dislike about those undocumented chips.
>
> Is it necessary to treat this differently than, say, 
> drivers/hwmon/it87.c and drivers/watchdog/it87_wdt.c ?
> Those work together nicely because most of the address space is 
> separate; access through Super-IO registers
> is limited enough that it can be shared by using request_muxed_region() 
> in both drivers.
>
> I'll have to look deeper into NCT6692D (and NCT6686, for that matter), 
> to see if those require mfd drivers.
> I'll also need to get the datasheets for those chips and confirm that 
> they really need different watchdog
> drivers to start with.
>
Ack - I'll look at those and see. Quick look at the watchdog driver and it looks possible but I need to check the details more carefully.
Afraid I can't share the datasheet as I don't have permission to release it. How much of a blocker is that for you?

Mark

