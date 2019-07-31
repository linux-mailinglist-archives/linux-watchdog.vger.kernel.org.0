Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1AAF67CCB6
	for <lists+linux-watchdog@lfdr.de>; Wed, 31 Jul 2019 21:24:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729459AbfGaTYO (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Wed, 31 Jul 2019 15:24:14 -0400
Received: from mail-pf1-f194.google.com ([209.85.210.194]:38643 "EHLO
        mail-pf1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726491AbfGaTYN (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Wed, 31 Jul 2019 15:24:13 -0400
Received: by mail-pf1-f194.google.com with SMTP id y15so32422325pfn.5;
        Wed, 31 Jul 2019 12:24:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=XH0pJb+BmHDMlg3LN2C00aPw3aAxQ3SWi54ovBfgsFI=;
        b=EyQrNpMTLGRwFJ4VkM6blKgTwhRlfj23LgEim255LUHYCYfiMoi6st1mS16619rQrq
         IxTFOd8Dh8y9UknRLll7cWkWXYInosAa49o71KF7n913vBlJzoEvbB6Nt5NzOr8tTDlV
         0zJrzmbWwnL3KDJk5oARea60OaB7sI7zzJbIIQyo4H4ONir3HDanBrTqvDevwHCHy/Gl
         GkUkoA2Hg3tFJ5/vqCjnOXGAP5YkfLv9z/TN32nUGSBPj+2HPCDbA2uGQE9EuLIBSxon
         NicejhhyXRL21Ps2eW+nDCGOYzjBeLJgpLoHcH8f3TdxZZwLWS9gLRFrKNiq/nMtsxA9
         xw8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to:user-agent;
        bh=XH0pJb+BmHDMlg3LN2C00aPw3aAxQ3SWi54ovBfgsFI=;
        b=pSMueICJC3WkEAIRueszoWxZ6JvaEXyTkrSAjJyuuZPK49w25dg9rTsbFuWvUWQmoO
         HjaZdpQBY5wS5y/uOIdUh7387eb84CKQfebcMdFka/rjVY+4dX6LHDreNEBdOP4Z8CJC
         c5fS1WbNxub5m/hXAAvChZ+D4zXP2RLtN3t7Hlk11lNuKTyRbJbWp+9CS6KCwC5LH5r2
         +ubpalmZEw6Eiz9CvkXKYjSwyJrMvF4ZSOu7wlgPb/XoJmXxzYh9r+i3YMB0PIsNQ/Eo
         bqoedBG6/2VMvrWpXjtFYLSxi9BYZrQdwLOu6MeAz100WWpMWhrME0tJX+IAeQXic6NZ
         sM3w==
X-Gm-Message-State: APjAAAX15W6HrRm/JuJyE655hBUMGWijd88zLmwsZcx7E0uDbhCumFsk
        G0vdAyDjyN8h2rAJEUYr8PY=
X-Google-Smtp-Source: APXvYqy67NwdfHuaYaIeCBVta5YDtxpw1Gd/SFDET9J+E1vBRX7SzwEbgdpdtF6LWFHI/NH81wLnEA==
X-Received: by 2002:a62:b615:: with SMTP id j21mr47775389pff.190.1564601053206;
        Wed, 31 Jul 2019 12:24:13 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id a12sm3078158pje.3.2019.07.31.12.24.11
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 31 Jul 2019 12:24:12 -0700 (PDT)
Date:   Wed, 31 Jul 2019 12:24:10 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     Mark Balantzyan <mbalant3@gmail.com>
Cc:     wim@linux-watchdog.org, linux-watchdog@vger.kernel.org,
        linux-kernel@vger.kernel.org, Pavel Andrianov <andrianov@ispras.ru>
Subject: Re: [PATCH] watchdog:alim1535_wdt: Fix data race in ali_settimer()
 concerning ali_timeout_bits variable.
Message-ID: <20190731192410.GA4935@roeck-us.net>
References: <20190718155238.3066-1-mbalant3@gmail.com>
 <20190718163458.GA18125@roeck-us.net>
 <alpine.DEB.2.21.1907310911120.29703@mbalantz-desktop>
 <20190731164337.GA13646@roeck-us.net>
 <alpine.DEB.2.21.1907311118190.81695@mbalantz-desktop>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <alpine.DEB.2.21.1907311118190.81695@mbalantz-desktop>
User-Agent: Mutt/1.5.24 (2015-08-30)
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

Mark,

On Wed, Jul 31, 2019 at 11:23:19AM -0700, Mark Balantzyan wrote:
> Hi Guenter, all,
> 
> It's alright if you still don't wish to review my patch on alim1535_wdt, but
> my employer and I, using our race condition analysis tool, detected it to
> contain a race condition warning. I believe any possible issues could be
> resolved if it were rewritten to use the watchdog subsystem as you've
> previously stated.
> 
> Now, I don't wish to bother you too much, but it seems I forgot to work
> mainly with my assigned mentor prior to submitting patches..sorry. So, after
> I have worked on rewriting the alim1535 driver into common watchdog
> subsystem with my mentor, may I submit it to you then?
> 

Similar to pc87413, this driver very likely has zero users left, there
won't be any hardware to test the patch, and we won't be able to accept
such a patch because it wasn't tested.

On top of that, the only race condition I can see in that driver is in
ali_settimer(), between ali_timeout_bits and timeout. Yet, that is not
really a race condition because the driver can only be opened once,
and thus there is no means for two threads entering ali_settimer()
at the same time.

I don't really understand this focus on fixing theoretic/irrelevant
race conditions in drivers which no one uses anymore. Maybe someone
can enlighten me ?

Thanks,
Guenter
