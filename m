Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3B50B460BCE
	for <lists+linux-watchdog@lfdr.de>; Mon, 29 Nov 2021 01:40:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239966AbhK2Ane (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Sun, 28 Nov 2021 19:43:34 -0500
Received: from mail-ot1-f53.google.com ([209.85.210.53]:37727 "EHLO
        mail-ot1-f53.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1376447AbhK2Ale (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Sun, 28 Nov 2021 19:41:34 -0500
Received: by mail-ot1-f53.google.com with SMTP id h19-20020a9d3e53000000b0056547b797b2so23154491otg.4;
        Sun, 28 Nov 2021 16:38:17 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=E72JH3qPve3IaJRIIHpNjEfmGNEKeSMsIdbErBvMGEw=;
        b=xzDveInSjgxohjfqw1bVoiKtPGqFgNzavTvpKzeKiuTh22GXUkhIuAN/oTy+UAEj8E
         BErODs+uekwEvrHIrBagInBzbsgXZqIpVwUMAOb5gj8ypHLfyD2FsJSaGN6UlLAVWJ/p
         7DcT921WYE0NITf7knowKQYcYGKi8Ptwk+tPo483MTiskqm7QjHFmkfqTU8VcTdSUoxC
         9/v+CflpYpz5Fy6admMcutKdg4j7i3XWVHAggTufO79KE8guzBSfy1Vyck7ljD2t/Tlf
         002luA8WRzktnF7MegIqxzSXpAq8lVodM2bFn6d/fqgzqdLSqb5vTs8YD8p2iBW4Wz+w
         gJ7A==
X-Gm-Message-State: AOAM530usamGYdr261aVy8GyIg+rjv4IXpHRisQchynzNq3xjYF0rO9r
        ZI7V9YYrc3NPW1UYxMDacoueFvWUVQ==
X-Google-Smtp-Source: ABdhPJziVXn3qJ+mgWJ3uxu6D6YRHrH/jMa6uf7JSsMejkVVNlzK5dkSSE8eo01JoVtJnLwDgHs1vA==
X-Received: by 2002:a9d:7d83:: with SMTP id j3mr41524816otn.236.1638146297295;
        Sun, 28 Nov 2021 16:38:17 -0800 (PST)
Received: from robh.at.kernel.org ([172.58.99.229])
        by smtp.gmail.com with ESMTPSA id r3sm2368764oti.51.2021.11.28.16.38.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 Nov 2021 16:38:16 -0800 (PST)
Received: (nullmailer pid 2901562 invoked by uid 1000);
        Mon, 29 Nov 2021 00:38:13 -0000
Date:   Sun, 28 Nov 2021 18:38:13 -0600
From:   Rob Herring <robh@kernel.org>
To:     Biju Das <biju.das.jz@bp.renesas.com>
Cc:     Guenter Roeck <linux@roeck-us.net>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        Biju Das <biju.das@bp.renesas.com>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        linux-renesas-soc@vger.kernel.org,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        linux-watchdog@vger.kernel.org
Subject: Re: [PATCH v3 1/2] dt-bindings: watchdog: renesas,wdt: Add support
 for RZ/G2L
Message-ID: <YaQg9ezHdQQtB0P+@robh.at.kernel.org>
References: <20211122113554.15990-1-biju.das.jz@bp.renesas.com>
 <20211122113554.15990-2-biju.das.jz@bp.renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211122113554.15990-2-biju.das.jz@bp.renesas.com>
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On Mon, 22 Nov 2021 11:35:53 +0000, Biju Das wrote:
> Describe the WDT hardware in the RZ/G2L series.
> 
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> ---
> V2->v3:
>  * No change.
> V1->V2:
>  * No Change
> RFC->V1:
>  * Added clock-names and interrupt-names as required properties for RZ/G2L
>  * Re-order clocknames with internal module clock first
> ---
>  .../bindings/watchdog/renesas,wdt.yaml        | 75 ++++++++++++++-----
>  1 file changed, 57 insertions(+), 18 deletions(-)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
