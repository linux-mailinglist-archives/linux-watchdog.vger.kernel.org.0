Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BE6CA131ACE
	for <lists+linux-watchdog@lfdr.de>; Mon,  6 Jan 2020 22:57:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727105AbgAFV5Y (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Mon, 6 Jan 2020 16:57:24 -0500
Received: from mail-ot1-f68.google.com ([209.85.210.68]:34137 "EHLO
        mail-ot1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726858AbgAFV5Y (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Mon, 6 Jan 2020 16:57:24 -0500
Received: by mail-ot1-f68.google.com with SMTP id a15so73520443otf.1
        for <linux-watchdog@vger.kernel.org>; Mon, 06 Jan 2020 13:57:24 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=TkT8eaIKGqV3wsrlyewlpi+P3L8o3guOiv9YMvMP6U8=;
        b=HwLxu8tiMuawuAq49dWHIu6K/5ePjr6z30Agm+5bd82WclESPU+DYtxmF378F9ShIk
         JXxOLjKQYsNTnTiY4waWT7iBBs1JzKtWIVvRt1Z1YZ4fw/v4ceY61+yyoCQVOIL3asxz
         BsSFbVZY5Rcm+aMAepmw2abVSCJ5igkgd/BVEJk5shJkJHn1hF8anTYm/R8hlD9JfKMx
         htVmG4/6gZvAaUVcm41gyNPio5BFKIxk2OUkNym6/L00VnXPkQyNPfXV6a9a5U3Dm+fX
         jjBweY+/za/xVMXfcB3Oj13Zfgi6K1oQa8R8x9t9TCO+hb/uX72j1gd1D2nzwgisbtb/
         uMzQ==
X-Gm-Message-State: APjAAAVQ8QxA3lNv70oUC6O0V614Cta3uS99rl6tL5vYm4ql4VY6VIHw
        SYefnrD6JcmxqnG8vyV7dHPF7XA=
X-Google-Smtp-Source: APXvYqxKp7fXQew34RbzPrgZHDvJgcnMhEAhzHdLyZws0sJH9uUHElThZOb84ssBLJ6W63CrQd57Kw==
X-Received: by 2002:a05:6830:10d5:: with SMTP id z21mr122573172oto.30.1578347843304;
        Mon, 06 Jan 2020 13:57:23 -0800 (PST)
Received: from rob-hp-laptop (ip-70-5-121-225.ftwttx.spcsdns.net. [70.5.121.225])
        by smtp.gmail.com with ESMTPSA id p65sm20259225oif.47.2020.01.06.13.57.22
        for <linux-watchdog@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jan 2020 13:57:22 -0800 (PST)
Received: from rob (uid 1000)
        (envelope-from rob@rob-hp-laptop)
        id 2219d8
        by rob-hp-laptop (DragonFly Mail Agent v0.11);
        Mon, 06 Jan 2020 15:57:21 -0600
Date:   Mon, 6 Jan 2020 15:57:21 -0600
From:   Rob Herring <robh@kernel.org>
To:     Jiaxin Yu <jiaxin.yu@mediatek.com>
Cc:     yong.liang@mediatek.com, wim@linux-watchdog.org,
        linux@roeck-us.net, p.zabel@pengutronix.de, matthias.bgg@gmail.com,
        linux-watchdog@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org,
        chang-an.chen@mediatek.com, freddy.hsin@mediatek.com,
        yingjoe.chen@mediatek.com, sboyd@kernel.org,
        Jiaxin Yu <jiaxin.yu@mediatek.com>
Subject: Re: [PATCH v10 1/2] dt-bindings: mediatek: mt8183: Add #reset-cells
Message-ID: <20200106215721.GB31059@bogus>
References: <1578280296-18946-1-git-send-email-jiaxin.yu@mediatek.com>
 <1578280296-18946-2-git-send-email-jiaxin.yu@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1578280296-18946-2-git-send-email-jiaxin.yu@mediatek.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On Mon, 6 Jan 2020 11:11:35 +0800, Jiaxin Yu wrote:
> Add #reset-cells property and update example
> 
> Signed-off-by: yong.liang <yong.liang@mediatek.com>
> Signed-off-by: Jiaxin Yu <jiaxin.yu@mediatek.com>
> Reviewed-by: Yingjoe Chen <yingjoe.chen@mediatek.com>
> Reviewed-by: Philipp Zabel <p.zabel@pengutronix.de>
> ---
>  .../devicetree/bindings/watchdog/mtk-wdt.txt  | 10 ++++++---
>  .../reset-controller/mt2712-resets.h          | 22 +++++++++++++++++++
>  .../reset-controller/mt8183-resets.h          | 17 ++++++++++++++
>  3 files changed, 46 insertions(+), 3 deletions(-)
>  create mode 100644 include/dt-bindings/reset-controller/mt2712-resets.h
> 

Please add Acked-by/Reviewed-by tags when posting new versions. However,
there's no need to repost patches *only* to add the tags. The upstream
maintainer will do that for acks received on the version they apply.

If a tag was not added on purpose, please state why and what changed.
