Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4BDAA19AF25
	for <lists+linux-watchdog@lfdr.de>; Wed,  1 Apr 2020 17:55:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732799AbgDAPzK (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Wed, 1 Apr 2020 11:55:10 -0400
Received: from mail-pj1-f66.google.com ([209.85.216.66]:37781 "EHLO
        mail-pj1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732683AbgDAPzK (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Wed, 1 Apr 2020 11:55:10 -0400
Received: by mail-pj1-f66.google.com with SMTP id k3so153964pjj.2;
        Wed, 01 Apr 2020 08:55:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:subject:to:cc:references:from:autocrypt:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=+Km3731noZ/bccDDjKdEx7MdqueB2skGZv0K/hQ6Vew=;
        b=BJV/KHbnvn+nA6yj9WtSx8WTykWAIDILXBgOS9jZ7KxdEAzeoseqtjbubWxweYibee
         53d2CKtbNNRXuxEHaoJ6UDylgN+u+RaI4uaTYIYOIKvpJytBM4sXJu5lHHYDas5lWiQT
         aPgLcA1b8r5ZO15PzOTKCAU76Lbf9vE+vH2ygBJKFXt6uy3BA1/12T8nGviLkmG7Wf/B
         fwRWi+UF2onEv6s683/c1ZgT6heCWQ1jwSV60cSypE5C1QfCXgg3n4hJZM7eKzOGRpwC
         ZKZBHv7/aSbXDNjxk6N+R5x2VyhM6Qaw57JksUgX81dIYJiYj3gdcTAdKVxOfVZilNDC
         HkmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:subject:to:cc:references:from:autocrypt
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=+Km3731noZ/bccDDjKdEx7MdqueB2skGZv0K/hQ6Vew=;
        b=oFNRDGP97AjRvL3HnAH55zDkCVSE8BQkBIj0XyalTVZK1MtV3e/DM6BFLJOQY+pI96
         jhu2Zz1K9sNNk9VR6xh+4TqdimgBIgsd7KE2cRbh3mPVWmxniTXfJ8BvHv4ZkXMWbd3F
         wtT6iI5lWGdTRvy+eiXHAJB2nyVDKSRSsCFz4x5JukMilLC3dHEqvVTRro5fIe+3hXnz
         9QmOdT3+a5iqebcAxMUV2C56QaYtwjFuP65VMSAGwvJ7NHl2ZPaj9LTlcL74U7aGpLgv
         5OT5EHu3rAZmWybl8A462PDxnbkMX7rRJH6+kM8rwQkP+tLPRFuGif07gYV7y4khKJff
         UAhg==
X-Gm-Message-State: ANhLgQ0Wk/txrIwa6pBgFYQoi+UkRdg73GCP94TREYC2W+63OUQQovY9
        CF87IPMNLQ33+X+s3ALXRtW92IBn
X-Google-Smtp-Source: ADFU+vvC1CIuWPtuvDnv3Tcn6KmU7rLai1w298X4+Zi4Vp6R3a7T2Lyf0x4v+8i+PIOAn1+pn7bmUg==
X-Received: by 2002:a17:902:b7cb:: with SMTP id v11mr24197650plz.307.1585756508054;
        Wed, 01 Apr 2020 08:55:08 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id f129sm1844099pfb.190.2020.04.01.08.55.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 01 Apr 2020 08:55:07 -0700 (PDT)
Subject: Re: [PATCHv3 3/4] watchdog: Add K3 RTI watchdog support
To:     Tero Kristo <t-kristo@ti.com>
Cc:     wim@linux-watchdog.org, linux-watchdog@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <aed89814-a78b-4a59-7673-bce5de34022d@roeck-us.net>
 <20200304104214.8625-1-t-kristo@ti.com> <20200304220648.GA31640@roeck-us.net>
 <ac261582-a101-c7c7-66e4-4ef20d037c7d@ti.com>
From:   Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
Message-ID: <422f7335-9774-9ec1-6b0f-f22f811746cf@roeck-us.net>
Date:   Wed, 1 Apr 2020 08:55:05 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <ac261582-a101-c7c7-66e4-4ef20d037c7d@ti.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On 4/1/20 5:44 AM, Tero Kristo wrote:
> On 05/03/2020 00:06, Guenter Roeck wrote:
>> On Wed, Mar 04, 2020 at 12:42:14PM +0200, Tero Kristo wrote:
>>> Texas Instruments K3 SoCs contain an RTI (Real Time Interrupt) module
>>> which can be used as a watchdog. This IP provides a support for
>>> windowed watchdog mode, in which the watchdog must be petted within
>>> a certain time window. If it is petted either too soon, or too late,
>>> a watchdog error will be triggered.
>>>
>>> Signed-off-by: Tero Kristo <t-kristo@ti.com>
>>
>> Reviewed-by: Guenter Roeck <linux@roeck-us.net>
> 
> Whats the plan for merging this one + the DT binding doc? I can't see this in linux-next yet at least, I do see the watchdog core change from this series though.
> 

It is in my watchdog-next branch at
git://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git.

Wim usually picks it up from there.

The core patch didn't depend on DT approval, so I (and Wim) picked it up
earlier.

Guenter
