Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7C882AC035
	for <lists+linux-watchdog@lfdr.de>; Fri,  6 Sep 2019 21:09:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2392837AbfIFTJA (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Fri, 6 Sep 2019 15:09:00 -0400
Received: from mail-pg1-f195.google.com ([209.85.215.195]:46214 "EHLO
        mail-pg1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728988AbfIFTJA (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Fri, 6 Sep 2019 15:09:00 -0400
Received: by mail-pg1-f195.google.com with SMTP id m3so3975358pgv.13;
        Fri, 06 Sep 2019 12:09:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=XLAbwCH4CH2GPFxKGgW5hLIRwoX3YXe2UqDB5BrzGc8=;
        b=O1Bg4eLxG6/wuX3whfk5t9vBOWq+jOJUhnqvb4NJJ4u365XRQmyTZU4+bRt/cVTNb3
         jH2z1BQggaQ7GAs8nugMF/9AQgBtNMq5PzwoFfA+I+k6B9FpehLFyWIPKUawYe5WyqvA
         J9A4HiK0+ggNfm/s3kkJhvuLIrlR3y6FeTJW3y6mKMlSGDxp6+SSYIQKu9o5XQh5je26
         GybmCfFHyroZ2kMmpFAq0sPZr0MdHrThiwD6TiYwOQJnhKGO8N+6K6y1EFgDFKcTHl/F
         apw1AFb2WW2n5ZR7YVxZwlyeyr4jbTNBm+HA70PvIXhULcNNguVTbiosMKEuxQs0M8Cz
         FJAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to:user-agent;
        bh=XLAbwCH4CH2GPFxKGgW5hLIRwoX3YXe2UqDB5BrzGc8=;
        b=ec5A5Gwr4l1XxYbPrw2cB3QMD4tCrH0ci+3ablXZPc+aNDY/f22/W/W+1lkJtw9fAK
         Om0RsQrUy5xEKJ5Dob4+HT+3koACMLCngz4MppDcpvRThgAnE0YG67fEQJXjC4s3iElI
         0Vu+RHSeBfQE3Vxvw7wOGL8bMsWrydXvyymarWXiXpHZ6jIm/53iwDmR2VMzFotCFhqA
         uj6hp2ezNCyaZdQN7kLmqUN/N1GvEbiNivso8PlcF3+gO7eYzxyxKq2EPQDBiqhlwQa6
         XiA02UPMBnZ9KTIuNlStv6VziccAOMQyAdN84/6oHPvld63y/ebkd43/q4nEC64AOi/2
         8Bxg==
X-Gm-Message-State: APjAAAUyOx2nZcaFcAyigyL+N6++7J444qY3F2z+pUTGE0sQhjOY9QB0
        GFOIOOi/DtJvftXfRuelO7Y=
X-Google-Smtp-Source: APXvYqySTVMyJzabuC59muoSsicSohGrAyg4Q1bPraBrGFkoGXyOSqY2WbHvyV5wJPt9XRnQFRhv6Q==
X-Received: by 2002:a62:780c:: with SMTP id t12mr12188159pfc.211.1567796939763;
        Fri, 06 Sep 2019 12:08:59 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id j9sm6666122pfi.128.2019.09.06.12.08.58
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 06 Sep 2019 12:08:58 -0700 (PDT)
Date:   Fri, 6 Sep 2019 12:08:57 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Jorge Ramirez-Ortiz <jorge.ramirez-ortiz@linaro.org>,
        agross@kernel.org, wim@linux-watchdog.org,
        linux-arm-msm@vger.kernel.org, linux-watchdog@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4] watchdog: qcom: support pre-timeout when the bark irq
 is available
Message-ID: <20190906190857.GA14545@roeck-us.net>
References: <20190905210035.9985-1-jorge.ramirez-ortiz@linaro.org>
 <20190906174009.GC11938@tuxbook-pro>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190906174009.GC11938@tuxbook-pro>
User-Agent: Mutt/1.5.24 (2015-08-30)
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On Fri, Sep 06, 2019 at 10:40:09AM -0700, Bjorn Andersson wrote:
> On Thu 05 Sep 14:00 PDT 2019, Jorge Ramirez-Ortiz wrote:
> > diff --git a/drivers/watchdog/qcom-wdt.c b/drivers/watchdog/qcom-wdt.c
> [..]
> > +static inline int qcom_get_enable(struct watchdog_device *wdd)
> > +{
> > +	int enable = QCOM_WDT_ENABLE;
> > +
> > +	if (wdd->info->options & WDIOF_PRETIMEOUT)
> > +		enable |= QCOM_WDT_ENABLE_IRQ;
> 
> Looking at downstream they conditionally write 3 to WDT_EN during
> initialization, but during suspend/resume they just set it to back to 1.
> 
Looks like a bug to me.

Either case, per API, pretimeout is enabled with the value of pretimeout,
not with interrupt information from DT. I am not inclined to accept the
above condition for enabling it.

> So I don't think you should touch BIT(1) (which name doesn't match
> downstream or the register documentation)
> 

You mean touching bit 1 is wrong to start with, and it is not a bit used
to enable the interrupt (and thus pretimeout) ?

Guess I'll need to dig out the manual myself.

Guenter
