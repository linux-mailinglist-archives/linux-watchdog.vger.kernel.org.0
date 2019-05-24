Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9558028E84
	for <lists+linux-watchdog@lfdr.de>; Fri, 24 May 2019 03:14:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731632AbfEXBOj (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Thu, 23 May 2019 21:14:39 -0400
Received: from www3345.sakura.ne.jp ([49.212.235.55]:26206 "EHLO
        www3345.sakura.ne.jp" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731608AbfEXBOj (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Thu, 23 May 2019 21:14:39 -0400
Received: from fsav405.sakura.ne.jp (fsav405.sakura.ne.jp [133.242.250.104])
        by www3345.sakura.ne.jp (8.15.2/8.15.2) with ESMTP id x4O1DuIj002595;
        Fri, 24 May 2019 10:13:56 +0900 (JST)
        (envelope-from na-hoan@jinso.co.jp)
Received: from www3345.sakura.ne.jp (49.212.235.55)
 by fsav405.sakura.ne.jp (F-Secure/fsigk_smtp/530/fsav405.sakura.ne.jp);
 Fri, 24 May 2019 10:13:55 +0900 (JST)
X-Virus-Status: clean(F-Secure/fsigk_smtp/530/fsav405.sakura.ne.jp)
Received: from nat.cybozu.com (nat.cybozu.com [103.79.14.78])
        (authenticated bits=0)
        by www3345.sakura.ne.jp (8.15.2/8.15.2) with ESMTPA id x4O1DtGR002590;
        Fri, 24 May 2019 10:13:55 +0900 (JST)
        (envelope-from na-hoan@jinso.co.jp)
Date:   Fri, 24 May 2019 10:13:55 +0900
From:   =?ISO-2022-JP?B?IhskQiUwJSclcyEmJSIlcyEmJVslISVzGyhCIg==?= 
        <na-hoan@jinso.co.jp>
To:     Wolfram Sang <wsa@the-dreams.de>
Cc:     linux-renesas-soc@vger.kernel.org, geert+renesas@glider.be,
        linux-watchdog@vger.kernel.org, wim@linux-watchdog.org,
        linux@roeck-us.net, wsa+renesas@sang-engineering.com,
        kuninori.morimoto.gx@renesas.com, yoshihiro.shimoda.uh@renesas.com,
        h-inayoshi@jinso.co.jp, cv-dong@jinso.co.jp
Message-ID: <155866043594663500007f86@nat.cybozu.com>
References: <20190523110451.GA3979@kunai>
In-Reply-To: <20190523110451.GA3979@kunai>
Subject: Re: [PATCH] watchdog: renesas_wdt: Fix interrupt enable for timer
X-Mailer: Cybozu Office 10.8
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-2022-JP
Content-Transfer-Encoding: 7bit
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

Dear Wolfram-san
Dear Geert- san

Thank you very much
Wolfram Sang wrote:
> Hi,
> 
> On Thu, May 23, 2019 at 06:29:37PM +0900, Nguyen An Hoan wrote:
> > From: Hoan Nguyen An <na-hoan@jinso.co.jp>
> > 
> > Fix setting for bit WOVFE of RWTCSRA. Keep it enable follow hardware document.
> 
> Hmm, I can't find it in the docs. Which version of the documentation do
> you use?
> 
> 
> > -	rwdt_write(priv, priv->cks, RWTCSRA);
> > +	val |= priv->cks;
> > +	rwdt_write(priv, val, RWTCSRA);
> 
> Have you tested this successfully? According to the docs, CKS bits are
> all 1 by default. So, your |= operation should be a NOP and we can't
> select a CKS value anymore if I am not mistaken.
> 
I tested and can confirm WOVFE was be disable by command 
rwdt_write(priv, priv->cks, RWTCSRA);
I don't understand why this bit is turned off but the watchdog can still reset, but 
according to the document it will be 1.

> >  	rwdt_write(priv, 0, RWTCSRB);
> >  
> >  	while (readb_relaxed(priv->base + RWTCSRA) & RWTCSRA_WRFLG)
> >  		cpu_relax();
> > -
> > -	rwdt_write(priv, priv->cks | RWTCSRA_TME, RWTCSRA);
> > +	/* Enable interrupt and timer */
> > +	rwdt_write(priv, val | RWTCSRA_WOVFE | RWTCSRA_TME, RWTCSRA);
> 
> What is the use of enabling an interrupt without having an interrupt
> handler? (And I never understood why there is an interrupt for an
> overflowing watchdog. We won't have time to serve it, or am I
> overlooking something obvious?)

I have added the interrupt node to dtsi and created the interrupt handler to successfully handle the Secure watchdog Gen2, but this is not documented.  With Gen 3, I am also thinking whether it is necessary or not.  Thank you!!!
With Gen3, after reset by WDT, then restart will have an interrupt when probe timer(), but we can do this no reset, after this,  timer operate normally. 
Problaly this patch should RFC

Thank you for your helps!!!


> 
> Kind regards,
> 
>    Wolfram
> 
