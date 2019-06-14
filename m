Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5100A45CF5
	for <lists+linux-watchdog@lfdr.de>; Fri, 14 Jun 2019 14:38:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727776AbfFNMiC (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Fri, 14 Jun 2019 08:38:02 -0400
Received: from mail-pf1-f195.google.com ([209.85.210.195]:36239 "EHLO
        mail-pf1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727544AbfFNMiB (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Fri, 14 Jun 2019 08:38:01 -0400
Received: by mail-pf1-f195.google.com with SMTP id r7so1404818pfl.3;
        Fri, 14 Jun 2019 05:38:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=811RVFyTr6F8u8h7/A4hNm78OD+rFY8gNrRGiFGCcyc=;
        b=TiKrOZtyl9+vWpiT5YYolR6ngPiktA5IY0pwmwXKG0SFnY+UrnqWD913FONkLs4cOD
         wtANWRUeFKygUVRAKReZkNJBdtRS+/U9cHjoAmVaEMXfRadFQxLW6BbLkPIeieU4NVfF
         gy5jKPdvd0qQhLaS1j98zfnCTOc+Fr+L6PYveSJS+AlhM2tVtUldhM5Ffedc0xXl4cJi
         qcgzr7qgit2RJLWx+13isHKFM39Ow33I2wz/GsDco8re4SljjGt+5tWuCHawC51MQebK
         /oqdhRHanTzAFs7Iqw6nCWYONSWkyS/fBEE3dwquBcap40JJeYmh1tRwuEOmk6utG0VJ
         i2FQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=811RVFyTr6F8u8h7/A4hNm78OD+rFY8gNrRGiFGCcyc=;
        b=enQEFBEQdo4bJ3s6oF9ATgmCHhU6x0WCL5F/o2EpPsdw+h30RBxawqxUZJMh/ryYiC
         YGVw/ZxuGb/vQNrZXXTOjvSK9qYvzh5eLSXMIK8K9HbCeXCoorINstGlwQeR40mQC5Ho
         oR0nBAjcJH+ybEp0Zo7ZWDeCC/j98gZBzj/8mOofr5rkOWA/o/SHOKCQgTp4Af+wAmVJ
         3ZK7pwaxHHejixBEZb79iJnLmbZG2YsnmfmMFI1ALEI1mWLAOS6WTTiV4lf+cu/7oOXG
         t34Jy6CiDp0+NdLQu9Q3BNdlXo3wdXOik4ES8sgzE2fDxKVdLQvXSMfdvSGrOOIKjZk7
         /etw==
X-Gm-Message-State: APjAAAWZ8E6RDOT6FRD1VpjemKhc1f2zaNk2BJktuPNZL2Nlatv4aN+Q
        dQbttXF0p6oonz5yWLtk7Bqnoz4Y
X-Google-Smtp-Source: APXvYqzzSc73CYWprv76l28hLngz0aYVGIWZv6m9dj1x4KjW1GW04Z3NedfaC2mRPEFVMV8fvqnSKw==
X-Received: by 2002:a17:90a:bb8a:: with SMTP id v10mr11109361pjr.78.1560515881083;
        Fri, 14 Jun 2019 05:38:01 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id a21sm4272797pfi.27.2019.06.14.05.37.58
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 14 Jun 2019 05:37:59 -0700 (PDT)
Subject: Re: [PATCH v10 3/3] watchdog: make the device time out at
 open_deadline when open_timeout is used
To:     Rasmus Villemoes <rasmus.villemoes@prevas.dk>
Cc:     "linux-watchdog@vger.kernel.org" <linux-watchdog@vger.kernel.org>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Jonathan Corbet <corbet@lwn.net>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
        Esben Haabendal <esben@haabendal.dk>,
        Jerry Hoemann <jerry.hoemann@hpe.com>,
        Rasmus Villemoes <Rasmus.Villemoes@prevas.se>
References: <20190605140628.618-1-rasmus.villemoes@prevas.dk>
 <20190605140628.618-4-rasmus.villemoes@prevas.dk>
 <20190607183827.GA32475@roeck-us.net>
 <56280052-9437-9813-a24e-125abb876762@prevas.dk>
From:   Guenter Roeck <linux@roeck-us.net>
Message-ID: <e63a0468-656f-0a8d-45a8-5236c42942b1@roeck-us.net>
Date:   Fri, 14 Jun 2019 05:37:57 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <56280052-9437-9813-a24e-125abb876762@prevas.dk>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On 6/14/19 1:41 AM, Rasmus Villemoes wrote:
> On 07/06/2019 20.38, Guenter Roeck wrote:
>> On Wed, Jun 05, 2019 at 02:06:44PM +0000, Rasmus Villemoes wrote:
>>> When the watchdog device is not open by userspace, the kernel takes
>>> care of pinging it. When the open_timeout feature is in use, we should
>>> ensure that the hardware fires close to open_timeout seconds after the
>>> kernel has assumed responsibility for the device.
>>>
>>> To do this, simply reuse the logic that is already in place for
>>> ensuring the same thing when userspace is responsible for regularly
>>> pinging the device:
>>>
>>> - When watchdog_active(wdd), this patch doesn't change anything.
>>>
>>> - When !watchdoc_active(wdd), the "virtual timeout" should be taken to
>>
>> s/watchdoc_active/watchdog_active/
>>
>> otherwise
>>
>> Reviewed-by: Guenter Roeck <linux@roeck-us.net>
> 
> Thanks! Wim, can you fix up if/when applying, or do you prefer I resend?
> 

I made the change when applying the patch to my watchdog-next branch,
and Wim usually picks up patches from there, so we should be good.

Thanks,
Guenter

