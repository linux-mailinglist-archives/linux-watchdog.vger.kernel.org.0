Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 62BB279DF3
	for <lists+linux-watchdog@lfdr.de>; Tue, 30 Jul 2019 03:30:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730332AbfG3Bav (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Mon, 29 Jul 2019 21:30:51 -0400
Received: from mail-pg1-f195.google.com ([209.85.215.195]:42041 "EHLO
        mail-pg1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729697AbfG3Bav (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Mon, 29 Jul 2019 21:30:51 -0400
Received: by mail-pg1-f195.google.com with SMTP id t132so29134470pgb.9;
        Mon, 29 Jul 2019 18:30:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=XD0Nb5oFkRw26a4H71gOJRD/jBf5EBDXEDMPrEeZ2Yw=;
        b=UljefasgRMtkpa6wnQBqBCt62+iTGdCNdau44Zeo7Ek+JSAnHD8bt0fo++4UkJWk1q
         XzGRmgsNYdqQ1d2JEYogvhTJ3+GfusXDXR1LJlvEjXimU61Ur3WGpJmEXqFgKajqrGyE
         lHTiy9yxD2QjCxKi73ydI9ekMDkCpPtRgxb2mu/KJsH9iOszfUkw0ipIdaJU1aMTAu1d
         O7AXd32EUUnI4LxdW5PF737h6trH9jaw/9Q1jWwf8ie04iU8wEDIh10FTuyJgcPzFV2q
         NvdnzRsrXmCBNHFQMV8dzqxTerkn/kaGMA3OEF3zXGbW0kff53KQJvZThTI6e+qLHgIb
         w9AA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=XD0Nb5oFkRw26a4H71gOJRD/jBf5EBDXEDMPrEeZ2Yw=;
        b=uPdVNVP5wSCdXar3CIP0QxRIWjD3xWAkz4jMyskP94VoM4nVcFVP/Fny3BkhQAVv7W
         OQDI3vUtUpBNnYnivDMPVkMo08c8GfPuFN3M4eypStRQdbolb7vr1txrDq/oLu0Cp9Ri
         vzur/CcaNLrp+1l1NFeoRj791fCnkVyK0Wlr9bdm1/uj0naxsNtfre4nrvj1bGHXMyvx
         LVIgNvsZn+T53p1KNN2Bua7Nolrag164OuPxHdvWFpSMdfnq0YYYvhjmjRrOoWirUlsD
         6haZ/umuXIem4SP56zd+1bbTo+lNBpn+pQYWy74YYA85BMvjjDjqv9SLODZSnE0hx5Bh
         9pXQ==
X-Gm-Message-State: APjAAAXiLeDhqbJvpMZ9ATqlll8LTt+sMB27W2fICEkBZX8wE40fHA2y
        +V7eV3Zvg4GGGqpVX6LaNBR5PDiU
X-Google-Smtp-Source: APXvYqxRx+E5380jw+KIEuBw+wATEsIziYP2tw7mQT1jTa2zlp56P7oEccO8DjL/y3x9J4wTum19bw==
X-Received: by 2002:a63:10a:: with SMTP id 10mr22893573pgb.281.1564450250582;
        Mon, 29 Jul 2019 18:30:50 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id j15sm62681173pfr.146.2019.07.29.18.30.48
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 29 Jul 2019 18:30:49 -0700 (PDT)
Subject: Re: [PATCH] watchdog device drivers:pc87413_wdt: Rewriting of
 pc87413_wdt driver to utilize common watchdog interface (fwd)
To:     Mark Balantzyan <mbalant3@gmail.com>
Cc:     linux-kernel@vger.kernel.org, linux-watchdog@vger.kernel.org,
        wim@linux-watchdog.org
References: <alpine.DEB.2.21.1907291614270.2893@mbalantz-desktop>
 <8e159e06-023e-6e20-ced5-3a645c0a1242@roeck-us.net>
 <alpine.DEB.2.21.1907291732130.20898@mbalantz-desktop>
From:   Guenter Roeck <linux@roeck-us.net>
Message-ID: <c28680b5-d262-97ae-5bdc-5cce9169e2da@roeck-us.net>
Date:   Mon, 29 Jul 2019 18:30:48 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <alpine.DEB.2.21.1907291732130.20898@mbalantz-desktop>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

Mark,

On 7/29/19 5:44 PM, Mark Balantzyan wrote:
> Hello all, Guenter,
> 
> I am being evaluated as a student by my organization. I appreciate your patience with my emails and patches.
> 
> I would like to please propose that we divide and conquer: I write the code for converting the driver to common watchdog interface (and I thank you for your guidance on it in previous email) and you test the code on the actual hardware you may happen to have, as I do not have it. I accept the fact that it is indeed risky without the hardware to ensure the driver works correctly, but that will be where we work in tandem, software to hardware, yes, if that's alright?
> 

If I had the hardware, I would say so. Then we would have no problem,
I would thank you for your work, and I would be more than happy to test
your patch on that hardware.

Unfortunately, I don't have the hardware, and I don't know anyone who (still)
has. The most recent functional change to this driver was made back in 2011.

If the task is to convert a watchdog driver, does it have to be _this_ driver ?
One that comes into mind instead would be ib700, which looks to be quite similar
and which _is_ supported by qemu. I have not tried if its qemu emulation
actually works, but it would be worth a try.

The only alternative I can see, if it has to be _this_ driver for some reason,
is for us to go through with it and then let the patch hang around until we
find someone to test it (which may be never). I am not really sure if that
would be worth our time.

> I think it's better if I use git send-email for the corresponding patch with the improvements you forecasted since it may format things better and may result in a non-corrupted patching.
> 
Most definitely, yes.

Thanks,
Guenter
