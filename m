Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A40FA3BD79
	for <lists+linux-watchdog@lfdr.de>; Mon, 10 Jun 2019 22:29:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389337AbfFJU3a (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Mon, 10 Jun 2019 16:29:30 -0400
Received: from mail-pg1-f174.google.com ([209.85.215.174]:39473 "EHLO
        mail-pg1-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2389331AbfFJU3a (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Mon, 10 Jun 2019 16:29:30 -0400
Received: by mail-pg1-f174.google.com with SMTP id 196so5628251pgc.6;
        Mon, 10 Jun 2019 13:29:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=1u+Mk6P0GQp2YK+MbgZCemejiKqi+QRb5rVGWIgElFw=;
        b=G6f3CvIrKb/qPOpOxDrnhusVhhss4a4rdtkGIF9mDlmmqxSCz9ObWvhgBgTnml10hK
         JlDF0m8kSM2MRPw0DedfKg+9suAC/0w4ywoA7lTnIPx8Vd0L5QZM9kIEIdUepk9/A/Ci
         L3MsIhQZWfa778Ov/yadphBGN+mqRGE4K8TJ0XcXmyKaYfOK0bHJNtcQJNQTlOX6mgPf
         64bOa+0uK/5ghOUmBiBDDHn00kAT8AOzLX3YDmwNBbldXKVw7I5mp39nlvqkgaTnQFLn
         YHKUn9nd/mzA8vWJXcCk0LQFfz3S9tv6sz66Jd4qeWovTDBwzjn2zTC5wxejL248uT+B
         It3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to:user-agent;
        bh=1u+Mk6P0GQp2YK+MbgZCemejiKqi+QRb5rVGWIgElFw=;
        b=n1MH7YF2AMUJYxCjcTAitWgMS/TyxrkYjX2PFIibfmSDv6CapqXHy+5s8/ehvn11c2
         2u5GYBgskzqzguJxVrtUm03nMqaXEcuY4eptEgQb3RNBpGdJeIFcXy8BYKqoRmxm/IuI
         lLPKrg237ExH9LQC4Z/FyEMB7VRd7qun/HmR+Lq3+pvPFRYoZK6nH64KXsoSracgLlD8
         MlNrEGvY3IxgxPDaKtHJBy6Jb8AAk1HxOZXjcVbAwmHRCMs+QDwjCAymOeGv2hFp3o7/
         YWWm2NdqbnhCJ8xGOXQTjw2Szm3ZN7W5ct5+/zVBOHuCjNFtUQ5bXkgpHgUOrMKcotvZ
         xFiw==
X-Gm-Message-State: APjAAAUJ4W4jkWAKB8AHaIPnA1JuGTRIcBiPo7yq1jSEXhRsbZskxoiL
        EzFGklwhnxBSy/uwbWSYdLg=
X-Google-Smtp-Source: APXvYqz8RUYRoaZm+zRUDtcye0JXQIhd3kp2snzDV/NHDjl0J3yKwIxNh87p7iEdeOMp2hurxqjFtA==
X-Received: by 2002:a62:5801:: with SMTP id m1mr77055067pfb.32.1560198569901;
        Mon, 10 Jun 2019 13:29:29 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id 131sm6435257pfx.57.2019.06.10.13.29.28
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 10 Jun 2019 13:29:29 -0700 (PDT)
Date:   Mon, 10 Jun 2019 13:29:28 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     Alexandre Belloni <alexandre.belloni@free-electrons.com>
Cc:     Ken Sloat <KSloat@aampglobal.com>,
        "Nicolas.Ferre@microchip.com" <Nicolas.Ferre@microchip.com>,
        "wim@iguana.be" <wim@iguana.be>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        "linux-watchdog@vger.kernel.org" <linux-watchdog@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [RFE]: watchdog: atmel: atmel-sama5d4-wdt
Message-ID: <20190610202928.GB13191@roeck-us.net>
References: <BL0PR07MB41152EDB169FE9ED1AD3B4C9AD130@BL0PR07MB4115.namprd07.prod.outlook.com>
 <20190610162811.GA11270@roeck-us.net>
 <20190610201301.GH25472@piout.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190610201301.GH25472@piout.net>
User-Agent: Mutt/1.5.24 (2015-08-30)
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On Mon, Jun 10, 2019 at 10:13:01PM +0200, Alexandre Belloni wrote:
> Hello,
> 
> On 10/06/2019 09:28:11-0700, Guenter Roeck wrote:
> > On Mon, Jun 10, 2019 at 03:51:52PM +0000, Ken Sloat wrote:
> > > Hello Nicolas,
> > > 
> > > I wanted to open a discussion proposing new functionality to allow disabling of the watchdog timer upon entering 
> > > suspend in the SAMA5D2/4.
> > > 
> > > Typical use case of a hardware watchdog timer in the kernel is a userspace application opens the watchdog timer and
> > > periodically "kicks" it. If the application hits a deadlock somewhere and is no longer able to kick it, then the watchdog
> > > intervenes and often resets the processor. Such is the case for the Atmel driver (which also allows a watchdog interrupt
> > > to be asserted in lieu of a system reset). In most use cases, upon entering a low power/suspend state, the application 
> > > will no longer be able to "kick" the watchdog. If the watchdog is not disabled or kicked via another method, then it will
> > > reset the system. This is the current behavior of the Atmel driver as of today.
> > > 
> > > The watchdog peripheral itself does have a "WDIDLEHLT" bit however, and this is enabled via the "atmel,idle-halt" dt
> > > property. However, this is not very useful, as it literally only makes the watchdog count when the CPU is active. This 
> > > results in non-deterministic triggering of the WDT and means that if a critical application were to crash, it may be
> > > quite a long time before the WDT would ever trigger. Below is a similar statement made in the device-tree doc for this
> > > peripheral:
> > > 
> > > - atmel,idle-halt: present if you want to stop the watchdog when the CPU is
> > > 		   in idle state.
> > > 	CAUTION: This property should be used with care, it actually makes the
> > > 	watchdog not counting when the CPU is in idle state, therefore the
> > > 	watchdog reset time depends on mean CPU usage and will not reset at all
> > > 	if the CPU stop working while it is in idle state, which is probably
> > > 	not what you want.
> > > 
> > > It seems to me, that it would be logical and useful to introduce a new property that would cause the Atmel WDT
> > > to disable on suspend and re-enable on resume. It also appears that the WDT is re-initialized anyways upon
> > > resume, so the only piece missing here would really be a dt flag and a call to disable.
> > > 
> > Wondering - why would this need a dt property ? That would be quite unusual. Is
> > there a condition where one would _not_ want the watchdog to stop on suspend ?
> > 
> 
> There are customers that protects suspend/resume using the watchdog.
> They wake up their platform every 15s to ping the watchdog.
> 

Interesting use case.

> Also, I don't see why the application deciding to go to suspend wouldn't
> be able to disable the watchdog before do so if this is the wanted policy.
> 

Many watchdog drivers already implement suspend/resume support. Such a
platform specific functionality seems to be quite undesirable to me.

Besides (and pretty much all watchdog drivers implementing suspend/resume
do that wrong), you'd likely want to disable the watchog late during
suspend and early during resume to reduce the risk of a hang. I don't
think you can do that from userspace.

Thanks,
Guenter
