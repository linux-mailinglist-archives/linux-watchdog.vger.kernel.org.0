Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 24EC04AE788
	for <lists+linux-watchdog@lfdr.de>; Wed,  9 Feb 2022 04:11:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1343904AbiBIDDh (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Tue, 8 Feb 2022 22:03:37 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56326 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1359817AbiBICyF (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Tue, 8 Feb 2022 21:54:05 -0500
Received: from mail-ot1-f48.google.com (mail-ot1-f48.google.com [209.85.210.48])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EF2CEC0613CC;
        Tue,  8 Feb 2022 18:54:04 -0800 (PST)
Received: by mail-ot1-f48.google.com with SMTP id b12-20020a9d754c000000b0059eb935359eso602925otl.8;
        Tue, 08 Feb 2022 18:54:04 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=skqCq82J8AGqsey0T3Vd7A5Yn+vbCdU5Y8vvi49uTAk=;
        b=hl5itkNBybgR3hyVgqCW0OGB6HNWmzyyE3/6qiy2dwyZN9tl+ahOtIEg3G4aFKN5Ke
         ZqosVQrL1Q0MoxP4ZRxEMniiK0CDin39SUinX4KKHhxR6K+c/CFdjPU64Bvl4xreeh4l
         Ka9E8FNeKWMp7Et8d03EKKfbu5TLAvGgFgFPUPNp6bZDym57uaNkGb26DQN98AV6+lT6
         xzW74PeFc+MxBN0JGyYYn/FRIUSpYmmrBmsAdXOU361bWUjvmbW0BpnREycSZRfK0C5T
         Ym2hERTzu5SBfgwh/444WfsOFbCUfns7n4wV45ujndfePPc7ECgpfYPe2ZMuQ/luiQfz
         HDDQ==
X-Gm-Message-State: AOAM5331+bAGRIU8N6BLDD8uUKQqMDIMS84dO2HlaWTWDdrj5gTme4qt
        OAoqCxivquEuy5w5eLCQvrosnd8YTQ==
X-Google-Smtp-Source: ABdhPJy2QaQUl/RAvttcJuhEQY0MCPtoZdPYnaR2fra+R96SMMD1BJQCyC6KSGgqR5XEv4bqHQEGTw==
X-Received: by 2002:a9d:24c5:: with SMTP id z63mr135034ota.365.1644375244288;
        Tue, 08 Feb 2022 18:54:04 -0800 (PST)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net. [66.90.148.213])
        by smtp.gmail.com with ESMTPSA id d2sm6142162ook.33.2022.02.08.18.54.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Feb 2022 18:54:03 -0800 (PST)
Received: (nullmailer pid 3526598 invoked by uid 1000);
        Wed, 09 Feb 2022 02:54:02 -0000
Date:   Tue, 8 Feb 2022 20:54:02 -0600
From:   Rob Herring <robh@kernel.org>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Guenter Roeck <linux@roeck-us.net>, devicetree@vger.kernel.org,
        linux-clk@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
        Thanh Quan <thanh.quan.xn@renesas.com>,
        LUU HOAI <hoai.luu.ub@renesas.com>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        linux-watchdog@vger.kernel.org, Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        linux-renesas-soc@vger.kernel.org,
        Magnus Damm <magnus.damm@gmail.com>
Subject: Re: [PATCH 2/5] dt-bindings: watchdog: renesas-wdt: Document
 r8a779f0 support
Message-ID: <YgMsymvddRTDCYVr@robh.at.kernel.org>
References: <cover.1642525158.git.geert+renesas@glider.be>
 <cca61a83ae82ecf5c23eb28e30c39f2f661f0e02.1642525158.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cca61a83ae82ecf5c23eb28e30c39f2f661f0e02.1642525158.git.geert+renesas@glider.be>
X-Spam-Status: No, score=-1.2 required=5.0 tests=BAYES_00,
        FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H3,
        RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On Tue, 18 Jan 2022 18:09:02 +0100, Geert Uytterhoeven wrote:
> From: Thanh Quan <thanh.quan.xn@renesas.com>
> 
> Document support for the Watchdog Timer (WDT) Controller in the Renesas
> R-Car S4-8 (R8A779F0) SoC.
> 
> Signed-off-by: Thanh Quan <thanh.quan.xn@renesas.com>
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
>  Documentation/devicetree/bindings/watchdog/renesas,wdt.yaml | 5 +++++
>  1 file changed, 5 insertions(+)
> 

Acked-by: Rob Herring <robh@kernel.org>
