Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3F350199F3B
	for <lists+linux-watchdog@lfdr.de>; Tue, 31 Mar 2020 21:38:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728187AbgCaTiF (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Tue, 31 Mar 2020 15:38:05 -0400
Received: from mail-pf1-f195.google.com ([209.85.210.195]:40191 "EHLO
        mail-pf1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727875AbgCaTiF (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Tue, 31 Mar 2020 15:38:05 -0400
Received: by mail-pf1-f195.google.com with SMTP id c20so8280354pfi.7
        for <linux-watchdog@vger.kernel.org>; Tue, 31 Mar 2020 12:38:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=vG5qfPDm3MPz5W/x+hD67RkQ5WLo/ChM9IWGmZizHNk=;
        b=tTIB3lrJ1xMrQ52zsWkcCGKAX5Y278qCFDQ3IgF/f3BHeao/kKfHMxBhbnV8SpHDtk
         r55qscI4Bmvvx9IBJrF2dMjGXys0dKOiN1rQqA1+F1pYdByghiTB4UNFAw2DS6z2nF6i
         +vEfVsIaqwVGawjtaO4rQbeqMYp07NhZegd5qzl9eRQrdaariKFEQptpNbi7YzkFAjs7
         pC9EkO/VFdSXuaAYosqji/PNyOSYK5ClZzR4ALHTnCCSKG89BeCloKoUFikzcd+8LoB+
         CbtvzEYTdir/WcJJf0cJw2onvtPHYH4XkqC2nh9fhZaD1aprdCWGdIKhxrjwlULiMnJn
         Kc/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to:user-agent;
        bh=vG5qfPDm3MPz5W/x+hD67RkQ5WLo/ChM9IWGmZizHNk=;
        b=buA+l3Zz9fSf+xQEMJKarV9KTp7cpyucjbJD3DPMJotK3BKoLUsOU21tpTTQxnT1LM
         Ux0GuldKXr6/v41oSj4fvbOWZy79B0HrhzhLyQmle1wpuaQqjkYntLKntB/jenrK9wEk
         Pf72nJNJ3ZSQ0ymHfOU8iQsXyfV0MKfm0tHs27Zmb8bgLwCqFsu3ZH8NsE37Zv0VT6KQ
         b2K6PtF1Kp65IOELK4Gv415ELQotMSRoN8pzy5b5whFDdBNJChWSnnQ1+rejkgasA1RT
         +scOpRBmYkB3zTzxirGWlsB7hk6xyETKFX3/ibxd5TNFf5bn5XwHyOydc3Akd215oOSA
         aBxA==
X-Gm-Message-State: ANhLgQ2XZXA+VbyotAiEPmGM6x7pCQJTehedOZPYqCJkznucrJzXx/uU
        sIzqNz2Hzr/dchMPhrY8vZs=
X-Google-Smtp-Source: ADFU+vtZE9O2Pkh/+728vACPd0ItBd//Jl4Y0OeQq68RCvjwJ2ouP74uZ9WrVDUsBgtQDvwmnDDHKQ==
X-Received: by 2002:a62:76c3:: with SMTP id r186mr19813133pfc.303.1585683483881;
        Tue, 31 Mar 2020 12:38:03 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id l22sm2572026pjq.15.2020.03.31.12.38.02
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 31 Mar 2020 12:38:03 -0700 (PDT)
Date:   Tue, 31 Mar 2020 12:38:02 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     "Daniel Walker (danielwa)" <danielwa@cisco.com>
Cc:     "linux-watchdog@vger.kernel.org" <linux-watchdog@vger.kernel.org>,
        Wim Van Sebroeck <wim@linux-watchdog.org>
Subject: Re: iTCO core dumping on timeout ?
Message-ID: <20200331193802.GA249004@roeck-us.net>
References: <20200331184304.GW823@zorba>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200331184304.GW823@zorba>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On Tue, Mar 31, 2020 at 06:43:05PM +0000, Daniel Walker (danielwa) wrote:
> Hi,
> 
> At Cisco we typical dump a core file in crash cases, and in watchdog timeouts.
> 
> It doesn't appear that the iTCO is setup to trigger a core dump, or panic. It
> looks like it just reboots on triggering.
> 
> Is there a method I'm missing which would allow selecting a core or panic for
> this driver?
> 

The iTCO (or at least some versions of it) can be configured for a dual timeout,
where the first timeout would generate an NMI and the second reset the system.
There have been a couple of submissions to introduce that functionality into
the driver, but none was followed through. Search for

"watchdog: iTCO_wdt: Introduce panic_on_timeout module param"
"watchdog: add NMI handler for iTCO watchdog"

for some history. The underlying problem is that there are several versions of
this hardware, and they all behave differently. This makes it difficult to
introduce such a change. On top of that, I am not sure if some of the registers
would have to be programmed by the BIOS.

Guenter
