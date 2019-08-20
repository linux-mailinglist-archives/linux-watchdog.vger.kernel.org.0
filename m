Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 209DD952B7
	for <lists+linux-watchdog@lfdr.de>; Tue, 20 Aug 2019 02:24:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728642AbfHTAY4 (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Mon, 19 Aug 2019 20:24:56 -0400
Received: from mail-ot1-f66.google.com ([209.85.210.66]:33438 "EHLO
        mail-ot1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728698AbfHTAY4 (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Mon, 19 Aug 2019 20:24:56 -0400
Received: by mail-ot1-f66.google.com with SMTP id q20so3438486otl.0
        for <linux-watchdog@vger.kernel.org>; Mon, 19 Aug 2019 17:24:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista-com.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:reply-to:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=WCqY+iBXMAqqQ5vuWipW5/2IV945lFKz1EiyviZlDsM=;
        b=V/e25NC211u42XpnicktW75cx7ZH5w5BTuVtBxvFv0y90Ifw/G770NQnLbCDGSRBym
         WvzYA/AaghLqKz/6ztzyNi29v0YOeYmALn/hF1Pe4NjLG72pr+ikyNZ8BnG8c85Fdsd1
         i6Q/29xw1dgdHhuSNvPhwHJn+9R8ifl5khDhrmGB4qDCh7WWn3e237iVRz1dob6qF6LN
         Y7xcbrkxJ3QSjyvk3f4JUrxlY7ElxQLlFLSFN/Qz03M/iS8w2paftCTnmZXkx2a6rSgY
         /wF/TCvviXMmPVlu5BDREiSOSBWv+v8ReUF7XgRuFy276qLJDRxiEd+O/2RoC0fRffKh
         DrYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:reply-to
         :references:mime-version:content-disposition:in-reply-to:user-agent;
        bh=WCqY+iBXMAqqQ5vuWipW5/2IV945lFKz1EiyviZlDsM=;
        b=ouSKttEUKsNpQUjBs2cDnfemFTq1CBe8D5z8ZzAPw8pRNvka6HOS2OQKCBOa8GZeqQ
         wv1VTc62mbSaut/X7S0wj6AiKbF+T9xTllO/FaLUQ2n/bASr/uqLTgE5VbbRkLfX6lZP
         LflS/+DESFttlCfUw1jXPi1lCbY3XakCW7g8cn0O5GTs3KA8LCNUG3+VTbCG0VhMTTEE
         Wia/xALMjVc4PjH8UhH3LMvt2gf84ibeSNqatYIqMrSxvI5I41idh1bugkn+ycIdFOsV
         SgOK+vjGu20fh7r4qR7nwNbOS+DyZxa92WpGauCiF+p/hleUExLfMJyvQJWCWlRpReOp
         L9PA==
X-Gm-Message-State: APjAAAX7p6M8e7gUTVi0GNCkeI5TEqCLSCfHFr7qeWOhS42sdVGxa9W5
        dX8/ZaF4fGpI+jhGD1PRLiEgLgYD2Br+Dw==
X-Google-Smtp-Source: APXvYqxlTFBXLPBZmMWqp1Ml1slUc2IUPX+v6vHauj284ewq43qzE3YkIAz48ml8vjx0jffHLgU2Gg==
X-Received: by 2002:a9d:7003:: with SMTP id k3mr21643640otj.28.1566260694893;
        Mon, 19 Aug 2019 17:24:54 -0700 (PDT)
Received: from minyard.net ([47.184.134.43])
        by smtp.gmail.com with ESMTPSA id j26sm4410512oii.33.2019.08.19.17.24.54
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 19 Aug 2019 17:24:54 -0700 (PDT)
Date:   Mon, 19 Aug 2019 19:24:52 -0500
From:   Corey Minyard <cminyard@mvista.com>
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     Convert@minyard.net, the@minyard.net, IPMI@minyard.net,
        watchdog@minyard.net, to@minyard.net, standard@minyard.net,
        interface@minyard.net, linux-watchdog@vger.kernel.org,
        Wim Van Sebroeck <wim@linux-watchdog.org>
Subject: Re: [PATCH 04/12] watchdog: Allow pretimeout governor setting to be
 accessed from modules
Message-ID: <20190820002452.GJ445@minyard.net>
Reply-To: cminyard@mvista.com
References: <20190819203711.32599-1-minyard@acm.org>
 <20190819203711.32599-5-minyard@acm.org>
 <20190819214953.GA7517@roeck-us.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190819214953.GA7517@roeck-us.net>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On Mon, Aug 19, 2019 at 02:49:53PM -0700, Guenter Roeck wrote:
> On Mon, Aug 19, 2019 at 03:37:03PM -0500, minyard@acm.org wrote:
> > From: Corey Minyard <cminyard@mvista.com>
> > 
> > This is so watchdog driver (like IPMI) can set it.
> > 
> > Signed-off-by: Corey Minyard <cminyard@mvista.com>
> > ---
> >  drivers/watchdog/watchdog_pretimeout.c | 1 +
> >  1 file changed, 1 insertion(+)
> > 
> > diff --git a/drivers/watchdog/watchdog_pretimeout.c b/drivers/watchdog/watchdog_pretimeout.c
> > index b45041b0ef39..270baf7b3fa0 100644
> > --- a/drivers/watchdog/watchdog_pretimeout.c
> > +++ b/drivers/watchdog/watchdog_pretimeout.c
> > @@ -95,6 +95,7 @@ int watchdog_pretimeout_governor_set(struct watchdog_device *wdd,
> >  
> >  	return 0;
> >  }
> > +EXPORT_SYMBOL_GPL(watchdog_pretimeout_governor_set);
> >  
> 
> I don't think that is a good idea. The whole point of pretimeout governor
> selection was to be able to configure it from userspace.

Yeah, this is really just a temporary thing.  There is a module parameter in
the IPMI watchdog that does basically the same thing as the device parameter
for setting the watchdog governor.  This is so that code can perform its
function.

I would expect this to go away eventually.

-corey

> 
> >  void watchdog_notify_pretimeout(struct watchdog_device *wdd)
> >  {
> > -- 
> > 2.17.1
> > 
