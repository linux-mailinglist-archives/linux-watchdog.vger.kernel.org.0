Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 810193B968
	for <lists+linux-watchdog@lfdr.de>; Mon, 10 Jun 2019 18:28:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725796AbfFJQ2P (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Mon, 10 Jun 2019 12:28:15 -0400
Received: from mail-pf1-f174.google.com ([209.85.210.174]:35183 "EHLO
        mail-pf1-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725270AbfFJQ2P (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Mon, 10 Jun 2019 12:28:15 -0400
Received: by mail-pf1-f174.google.com with SMTP id d126so5614409pfd.2;
        Mon, 10 Jun 2019 09:28:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=pzj2b7hhZ6YD/6WjtCfGTasSPRqjwrp/TQaWna9lfxQ=;
        b=kXJKW/rTaV349rH2wd2kV6vNyJDRVZDsMUieB0amtC3z2MOtjzZbgDTCBZh5U5eSGS
         UxkGP6xS31s2n9lrkS+hvcUCsyD6X8O+nYZSPIWF+A6d/moRShUOf73RMiZsQNi3uq6Y
         bQtvKasAaLHPNTtI7oL1owlaJhtixBq1H3FOnMIye7VZDHUmKpBLD/IP7kvb8c9/yN7c
         sut9J6cyeFklUe+8T0UqEpTVVkFyOC+XTxdq+j6asKfP4bJwAWsJnLDQIuDEy3MO31T0
         ljyr4/C0QWt3Xe/J9v8peYKk2fSABVUaoMa2hTtvTRrQbO9tk3SUFEVLadOQgbFn1e7O
         fnAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to:user-agent;
        bh=pzj2b7hhZ6YD/6WjtCfGTasSPRqjwrp/TQaWna9lfxQ=;
        b=j550qcdFbMDxToU2Scem/MZzc8QP1LNhlmvZawdlLgetCieWZgmjg68niz4P9a8ZIe
         aGYQaG/xyPAFLapTeMWK66m3LJfTMQUfoBOoNL7Usg/b/v/HyNn1AExRwQAxDbe7ljtp
         KwIfhXWpJLifeDI5LQiLFI8b9kNVNxt0csMbZYknAF+km8Z5IhctjMA1VGLswGzrDcuh
         8GVsPPdPvMHZrEgmyo40n3xuIyPALDOMzRGQjPJhgsLn8RhqRBCE2Zcr7d7qw/UEA8Nu
         ik79VY877bNNCg9giwP/AyIxyfy9gGcsgq6uiUP+bHykLOwDm1IOaarTf3zesE7iMLqT
         41dw==
X-Gm-Message-State: APjAAAWDPtghtkvm/nrrQ1FFpdiYhTHuY6NxOm924uL7IMqI20EVol28
        M2iPtPkPd77uhbZ5FvMaH0g=
X-Google-Smtp-Source: APXvYqzTViCOZCWdvHqZEgftq3IgTD0jneFi/Mem0y2YPV1OcS6ucnGC/wdKzKKtq7K2fg6dqre64A==
X-Received: by 2002:a63:5207:: with SMTP id g7mr15864200pgb.356.1560184094523;
        Mon, 10 Jun 2019 09:28:14 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id m24sm13643054pgh.75.2019.06.10.09.28.12
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 10 Jun 2019 09:28:13 -0700 (PDT)
Date:   Mon, 10 Jun 2019 09:28:11 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     Ken Sloat <KSloat@aampglobal.com>
Cc:     "Nicolas.Ferre@microchip.com" <Nicolas.Ferre@microchip.com>,
        "alexandre.belloni@free-electrons.com" 
        <alexandre.belloni@free-electrons.com>,
        "wim@iguana.be" <wim@iguana.be>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        "linux-watchdog@vger.kernel.org" <linux-watchdog@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [RFE]: watchdog: atmel: atmel-sama5d4-wdt
Message-ID: <20190610162811.GA11270@roeck-us.net>
References: <BL0PR07MB41152EDB169FE9ED1AD3B4C9AD130@BL0PR07MB4115.namprd07.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <BL0PR07MB41152EDB169FE9ED1AD3B4C9AD130@BL0PR07MB4115.namprd07.prod.outlook.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On Mon, Jun 10, 2019 at 03:51:52PM +0000, Ken Sloat wrote:
> Hello Nicolas,
> 
> I wanted to open a discussion proposing new functionality to allow disabling of the watchdog timer upon entering 
> suspend in the SAMA5D2/4.
> 
> Typical use case of a hardware watchdog timer in the kernel is a userspace application opens the watchdog timer and
> periodically "kicks" it. If the application hits a deadlock somewhere and is no longer able to kick it, then the watchdog
> intervenes and often resets the processor. Such is the case for the Atmel driver (which also allows a watchdog interrupt
> to be asserted in lieu of a system reset). In most use cases, upon entering a low power/suspend state, the application 
> will no longer be able to "kick" the watchdog. If the watchdog is not disabled or kicked via another method, then it will
> reset the system. This is the current behavior of the Atmel driver as of today.
> 
> The watchdog peripheral itself does have a "WDIDLEHLT" bit however, and this is enabled via the "atmel,idle-halt" dt
> property. However, this is not very useful, as it literally only makes the watchdog count when the CPU is active. This 
> results in non-deterministic triggering of the WDT and means that if a critical application were to crash, it may be
> quite a long time before the WDT would ever trigger. Below is a similar statement made in the device-tree doc for this
> peripheral:
> 
> - atmel,idle-halt: present if you want to stop the watchdog when the CPU is
> 		   in idle state.
> 	CAUTION: This property should be used with care, it actually makes the
> 	watchdog not counting when the CPU is in idle state, therefore the
> 	watchdog reset time depends on mean CPU usage and will not reset at all
> 	if the CPU stop working while it is in idle state, which is probably
> 	not what you want.
> 
> It seems to me, that it would be logical and useful to introduce a new property that would cause the Atmel WDT
> to disable on suspend and re-enable on resume. It also appears that the WDT is re-initialized anyways upon
> resume, so the only piece missing here would really be a dt flag and a call to disable.
> 
Wondering - why would this need a dt property ? That would be quite unusual. Is
there a condition where one would _not_ want the watchdog to stop on suspend ?

If anything I would suggest to drop atmel,idle-halt completely; it really looks
like it would make the watchdog unreliable.

Thanks,
Guenter
