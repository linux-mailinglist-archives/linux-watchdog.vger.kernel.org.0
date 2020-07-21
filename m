Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EC2CD227519
	for <lists+linux-watchdog@lfdr.de>; Tue, 21 Jul 2020 04:00:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726654AbgGUCAS (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Mon, 20 Jul 2020 22:00:18 -0400
Received: from mail-io1-f65.google.com ([209.85.166.65]:34436 "EHLO
        mail-io1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726177AbgGUCAS (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Mon, 20 Jul 2020 22:00:18 -0400
Received: by mail-io1-f65.google.com with SMTP id q74so19779270iod.1;
        Mon, 20 Jul 2020 19:00:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=FmMcR7bFgAbPLpnDgBuNJ/QOdeTydhIGFIIKbAfYHLc=;
        b=DBKMccO5vJXzEbb2SfBpJyCMnSRJ3gIUm6iCWr6aggiQMq7uvXjNyhQxtX23SKPRPf
         f+L3OKv4ASweEUlghIMS96tKBkFYl+ygUPwPrENxSBw36kYc4HitysoZ4VoEX4ePh7jt
         k2EOdfO02PCWxr6maacAMlMcupHq7WLN/fbfEPRevAymsmomHr6KiJWtE9femsG2dHoq
         Huv71uYTxKwP0VGvznii8ML/p5gQe2t7h4pjpYm3aKxIfi23ev2UKjbxGvd4Bobl72oI
         3e0IUHorK9tjPWesEyVmRAdlaNe7PGUDgbm2spnkYAudZymKvl0yehliXecabs+sYq5C
         v3+w==
X-Gm-Message-State: AOAM533ZxzJCpKmq0DditS3okVw2w7P5/XbTf7cxxRtgtlv9nWM/LrKJ
        BHJz8p+0ZtrD/pvC1ReSMA==
X-Google-Smtp-Source: ABdhPJwhnO6KFKqTJj7W0G2Pyf40GHKO0vAS3652npoyiOGFKvW5LYiU1O7APX+KBwy1giPuOOuwZQ==
X-Received: by 2002:a05:6638:e93:: with SMTP id p19mr28858875jas.67.1595296817346;
        Mon, 20 Jul 2020 19:00:17 -0700 (PDT)
Received: from xps15 ([64.188.179.252])
        by smtp.gmail.com with ESMTPSA id n10sm439007iom.21.2020.07.20.19.00.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jul 2020 19:00:16 -0700 (PDT)
Received: (nullmailer pid 3371853 invoked by uid 1000);
        Tue, 21 Jul 2020 02:00:15 -0000
Date:   Mon, 20 Jul 2020 20:00:15 -0600
From:   Rob Herring <robh@kernel.org>
To:     "Alexander A. Klimov" <grandmaster@al2klimov.de>
Cc:     devicetree@vger.kernel.org, wim@linux-watchdog.org,
        linux@roeck-us.net, linux-watchdog@vger.kernel.org,
        linux-kernel@vger.kernel.org, robh+dt@kernel.org
Subject: Re: [PATCH] watchdog: Replace HTTP links with HTTPS ones
Message-ID: <20200721020015.GA3371820@bogus>
References: <20200713205821.38223-1-grandmaster@al2klimov.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200713205821.38223-1-grandmaster@al2klimov.de>
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On Mon, 13 Jul 2020 22:58:21 +0200, Alexander A. Klimov wrote:
> Rationale:
> Reduces attack surface on kernel devs opening the links for MITM
> as HTTPS traffic is much harder to manipulate.
> 
> Deterministic algorithm:
> For each file:
>   If not .svg:
>     For each line:
>       If doesn't contain `\bxmlns\b`:
>         For each link, `\bhttp://[^# \t\r\n]*(?:\w|/)`:
> 	  If neither `\bgnu\.org/license`, nor `\bmozilla\.org/MPL\b`:
>             If both the HTTP and HTTPS versions
>             return 200 OK and serve the same content:
>               Replace HTTP with HTTPS.
> 
> Signed-off-by: Alexander A. Klimov <grandmaster@al2klimov.de>
> ---
>  Continuing my work started at 93431e0607e5.
>  See also: git log --oneline '--author=Alexander A. Klimov <grandmaster@al2klimov.de>' v5.7..master
>  (Actually letting a shell for loop submit all this stuff for me.)
> 
>  If there are any URLs to be removed completely or at least not just HTTPSified:
>  Just clearly say so and I'll *undo my change*.
>  See also: https://lkml.org/lkml/2020/6/27/64
> 
>  If there are any valid, but yet not changed URLs:
>  See: https://lkml.org/lkml/2020/6/26/837
> 
>  If you apply the patch, please let me know.
> 
>  Sorry again to all maintainers who complained about subject lines.
>  Now I realized that you want an actually perfect prefixes,
>  not just subsystem ones.
>  I tried my best...
>  And yes, *I could* (at least half-)automate it.
>  Impossible is nothing! :)
> 
> 
>  Documentation/devicetree/bindings/watchdog/davinci-wdt.txt | 4 ++--
>  drivers/watchdog/Kconfig                                   | 2 +-
>  drivers/watchdog/dw_wdt.c                                  | 2 +-
>  drivers/watchdog/nv_tco.c                                  | 2 +-
>  drivers/watchdog/nv_tco.h                                  | 2 +-
>  drivers/watchdog/sp5100_tco.c                              | 2 +-
>  6 files changed, 7 insertions(+), 7 deletions(-)
> 

Acked-by: Rob Herring <robh@kernel.org>
