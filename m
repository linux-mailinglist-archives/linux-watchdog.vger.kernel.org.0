Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 00644402EC0
	for <lists+linux-watchdog@lfdr.de>; Tue,  7 Sep 2021 21:09:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243501AbhIGTKR (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Tue, 7 Sep 2021 15:10:17 -0400
Received: from mail-ot1-f51.google.com ([209.85.210.51]:36854 "EHLO
        mail-ot1-f51.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230203AbhIGTKR (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Tue, 7 Sep 2021 15:10:17 -0400
Received: by mail-ot1-f51.google.com with SMTP id a20-20020a0568300b9400b0051b8ca82dfcso402519otv.3;
        Tue, 07 Sep 2021 12:09:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=y6f0OvD6qMOZIJO8Ax2BSoOx4xel1z8MSZtwDVuqZG4=;
        b=qOomiu05TQG11lvFX3qWsOEdyZRzXTGmJ9XVcq2spmBOJPnzHME+aEafkr7VW6Yk31
         oyiPiTMoJBmqQZ7NaVuG0KhFkg5Rj9mGVMTX7e3jwjbFCVu142jrcwzxciK+GyRZFTSP
         kftDENvCu7Gt0hGJIgQJ2lKm1o3cbkU6+ATKO4a7s/nuvMGNgVxmUbQrGifRab0LGsks
         XiJwYD5kiw24NfKEr6pVr6ncizP000ED2KtmO+ssVldEmIPZnNYnHznidWmqs0rLSP26
         CtwHQK9AV25q/nRWYiwGXlYFhmFNG4OooNigSa74zG6ZIYaxUX6eNNtyLU6/3em/E3gc
         spYA==
X-Gm-Message-State: AOAM531kQuSvvJLiOeSTVrtiE+ZoZMjAXw2ACSY09sc8dAjfq52v5RFf
        xW269euPZJTXAxv00ks81A==
X-Google-Smtp-Source: ABdhPJwyWZEq2w/4Mwc8OOnY+ZM6/dWiGZ2obaXegjgzTgjLf0vQ0Va+W9t3AfsRWmBdCHbeme6CZQ==
X-Received: by 2002:a9d:5a81:: with SMTP id w1mr13219426oth.307.1631041750386;
        Tue, 07 Sep 2021 12:09:10 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net. [66.90.148.213])
        by smtp.gmail.com with ESMTPSA id u15sm2455443oon.35.2021.09.07.12.09.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Sep 2021 12:09:09 -0700 (PDT)
Received: (nullmailer pid 174203 invoked by uid 1000);
        Tue, 07 Sep 2021 19:09:08 -0000
Date:   Tue, 7 Sep 2021 14:09:08 -0500
From:   Rob Herring <robh@kernel.org>
To:     Samuel Holland <samuel@sholland.org>
Cc:     linux-sunxi@lists.linux.dev, Chen-Yu Tsai <wens@csie.org>,
        linux-arm-kernel@lists.infradead.org,
        Maxime Ripard <mripard@kernel.org>,
        linux-watchdog@vger.kernel.org,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        linux-kernel@vger.kernel.org, Guenter Roeck <linux@roeck-us.net>,
        devicetree@vger.kernel.org,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Icenowy Zheng <icenowy@aosc.io>,
        Rob Herring <robh+dt@kernel.org>
Subject: Re: [PATCH v3 2/3] dt-bindings: watchdog: sunxi: Add compatibles for
 D1
Message-ID: <YTe41ClZvYS/llHF@robh.at.kernel.org>
References: <20210902225750.29313-1-samuel@sholland.org>
 <20210902225750.29313-3-samuel@sholland.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210902225750.29313-3-samuel@sholland.org>
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On Thu, 02 Sep 2021 17:57:49 -0500, Samuel Holland wrote:
> D1 keeps the same register layout and clock sources as the R329, but it
> adds a key field which must be set to update the watchdog's "CFG" and
> "MODE" registers. Therefore it is not backward-compatible.
> 
> Similarly to the R329, the D1 has three watchdog instances, and only one
> of them has the "soft reset" registers. So that instance needs an extra
> compatible string.
> 
> Signed-off-by: Samuel Holland <samuel@sholland.org>
> ---
> Changes v2 to v3:
>  - Add additional allwinner,sun20i-d1-wdt-reset compatible
> Changes v1 to v2:
>  - None
> 
>  .../bindings/watchdog/allwinner,sun4i-a10-wdt.yaml          | 6 ++++++
>  1 file changed, 6 insertions(+)
> 

Acked-by: Rob Herring <robh@kernel.org>
