Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D2A3243FF47
	for <lists+linux-watchdog@lfdr.de>; Fri, 29 Oct 2021 17:16:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229621AbhJ2PSe (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Fri, 29 Oct 2021 11:18:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56426 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229610AbhJ2PSe (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Fri, 29 Oct 2021 11:18:34 -0400
Received: from mail-ot1-x333.google.com (mail-ot1-x333.google.com [IPv6:2607:f8b0:4864:20::333])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AB592C061570
        for <linux-watchdog@vger.kernel.org>; Fri, 29 Oct 2021 08:16:05 -0700 (PDT)
Received: by mail-ot1-x333.google.com with SMTP id 71-20020a9d034d000000b00553e24ce2b8so9345705otv.7
        for <linux-watchdog@vger.kernel.org>; Fri, 29 Oct 2021 08:16:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=gjUQDOeFMNB7r5SFjUDA729tCoVjBOgoKKvglX3Otho=;
        b=PKaOLyPZP05QTmfBhmBaPf98iXDtag8Eu4nV66wOZDXC6093yr7rcaV4t9okVtXf/b
         td/9L9NIYt/OubGeMmCOUpRuMMSsB2e7joJ4oeKoGyGW498IulWNBv1PsTEh6b7pNCSI
         sJbI+NvqsqMRcZcYkqfa1xOJzx9x/L3wwQPD9KdS39cioF7mBMVkKPeqEuvOsJnQk20h
         Op4VEjmsuBoED3SQaA69Ov5ZN8Jr3AaBos+opvuzPIXbaAt38ntjHMN3S9VzV6p5i99t
         8jQwMXu7C92++YNb8aho504cpJJ6unRMKpS63zUUuA6SipiwnxcmAxgTBVTM8lJSrEsU
         z4rQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition
         :content-transfer-encoding:in-reply-to;
        bh=gjUQDOeFMNB7r5SFjUDA729tCoVjBOgoKKvglX3Otho=;
        b=yhPvzaNlxlFxlc1FD96SGzYuRxSmSAR8oYJRHJxSXJZ1YsmfM+9OU6aLQnek7/XO/D
         xHY0kFu2dHPv83eT3Yf9vn6dzC63XdpSoosxT3ijLoVuQCthFmjauNj4npkvCMzmsd7E
         IdkiY+dfXdNDcoL6FXNFXjStAcpKidp92qNfFwiRzJ9tB43rnuo3nxcaQl9ohddhIxqE
         gEj1SVCSpUEXwyFa7beLygpSGvUEgIBK68hia1Z38SNSyflycsiKGXLmipPKnIHc1xKO
         O3FwLUXp/WchRWHEk/s3lFMZHcvoetE+NtMN/IdtKK75C7ygoYm2QBZJ4AJwJVbErL9M
         88WA==
X-Gm-Message-State: AOAM530steZyshrKZRrCEP/hDEWMN1sihPHOsHYtfLdT8Eeo2Eoiuv3A
        mJ3YfE9nI4irqoSaNEKQNow=
X-Google-Smtp-Source: ABdhPJxFE/xFO+SEr9kMqthxAEtJgia3+kAEIY3YDk9/ZxfOhdCrgt5BEXv3U9inqr25ay9IK75mFg==
X-Received: by 2002:a05:6830:4002:: with SMTP id h2mr9109533ots.49.1635520565028;
        Fri, 29 Oct 2021 08:16:05 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id f13sm1983413oto.53.2021.10.29.08.16.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Oct 2021 08:16:04 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date:   Fri, 29 Oct 2021 08:16:02 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     Lee Jones <lee.jones@linaro.org>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        linux-watchdog@vger.kernel.org
Subject: Re: [PATCH 1/3] watchdog: ux500_wdt: Drop platform data
Message-ID: <20211029151602.GA1711005@roeck-us.net>
References: <20210922230947.1864357-1-linus.walleij@linaro.org>
 <20211029103128.GA3165629@roeck-us.net>
 <YXvR/ZNrjxHZM3pY@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <YXvR/ZNrjxHZM3pY@google.com>
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On Fri, Oct 29, 2021 at 11:50:37AM +0100, Lee Jones wrote:
> On Fri, 29 Oct 2021, Guenter Roeck wrote:
> 
> > On Thu, Sep 23, 2021 at 01:09:45AM +0200, Linus Walleij wrote:
> > > Drop the platform data passing from the PRCMU driver. This platform
> > > data was part of the ambition to support more SoCs, which in turn
> > > were never mass produced.
> > > 
> > > Only a name remains of the MFD cell so switch to MFD_CELL_NAME().
> > > 
> > > Cc: Lee Jones <lee.jones@linaro.org>
> > > Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> > > Reviewed-by: Guenter Roeck <linux@roeck-us.net>
> > > ---
> > > Lee: it'd be prefect if you could ACK this so the watchdog people
> > > can merge it, it shouldn't collide with any other changes to
> > > the PRCMU driver.
> > 
> > Still waiting for an Ack from Lee to be able to apply this patch
> > (and with it the rest of the series) through the watchdog tree.
> 
> Apologies for not being clear - this was for the series:
> 
> https://lore.kernel.org/all/YWfQt8V2YNMr4t8F@google.com/
> 

No problem, I should have asked earlier.
Thanks a lot for the clarification.

Guenter

> -- 
> Lee Jones [李琼斯]
> Senior Technical Lead - Developer Services
> Linaro.org │ Open source software for Arm SoCs
> Follow Linaro: Facebook | Twitter | Blog
