Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4E74B12506C
	for <lists+linux-watchdog@lfdr.de>; Wed, 18 Dec 2019 19:15:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726939AbfLRSPB (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Wed, 18 Dec 2019 13:15:01 -0500
Received: from mail-ot1-f65.google.com ([209.85.210.65]:42774 "EHLO
        mail-ot1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727341AbfLRSPB (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Wed, 18 Dec 2019 13:15:01 -0500
Received: by mail-ot1-f65.google.com with SMTP id 66so3531021otd.9;
        Wed, 18 Dec 2019 10:15:00 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=Joaw7/XAOOveu1GS58tOvSo24yLU2Vq2eez0hj0oxxI=;
        b=InUP9nsTzmlFIiCN6b86zG4A/PqSGnWE91tsI4HBG8weXa20RWogHEHuFT9aJyg+ZE
         XYiv20AA3iNiiPXWqzkzBg9wx0DmnNiNToZBmuCD3VbUzomLl5h+1hjVHtWkJyB5frxK
         iu3wMZTOo59yobdKUuWVgz8msIM7Ls1x0dFjCp4qzCZz5qwTGeSIDEtMJPbnbvb/GMae
         4RVSaJwf3dU+bi/JzPVNqNTXi4HXM9JweK63VfC+1GF8TfLiClPgV54Hhk5gmC/IRwVY
         GEjVKLPqsP2xv2BLuYYHFb9l4BL6wpCrJTJOReqWt2xWHdaGag9PqYgi5p8S+NQeaQtz
         QwGg==
X-Gm-Message-State: APjAAAWFIJb6O/YL2g3/zlqb1qn4yN/m14/7DbcQkevbqND/vhWcLqfM
        RiYqBo8+FIsqixrJl13IfQ==
X-Google-Smtp-Source: APXvYqyoQd/upD6YD3POKyWidARuJplw8nUXBR63avEydvr3JAGmT9UWeuqxABxXovlfVreAUCvwWA==
X-Received: by 2002:a9d:5e9a:: with SMTP id f26mr3967611otl.307.1576692895673;
        Wed, 18 Dec 2019 10:14:55 -0800 (PST)
Received: from localhost (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id t196sm802325oie.11.2019.12.18.10.14.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Dec 2019 10:14:55 -0800 (PST)
Date:   Wed, 18 Dec 2019 12:14:54 -0600
From:   Rob Herring <robh@kernel.org>
To:     Jiaxin Yu <jiaxin.yu@mediatek.com>
Cc:     yong.liang@mediatek.com, wim@linux-watchdog.org,
        linux@roeck-us.net, p.zabel@pengutronix.de, matthias.bgg@gmail.com,
        linux-watchdog@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org,
        sboyd@kernel.org, yingjoe.chen@mediatek.com
Subject: Re: [PATCH v6 1/2] dt-bindings: mediatek: mt8183: Add #reset-cells
Message-ID: <20191218181454.GA15293@bogus>
References: <1576081356-18298-1-git-send-email-jiaxin.yu@mediatek.com>
 <1576081356-18298-2-git-send-email-jiaxin.yu@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1576081356-18298-2-git-send-email-jiaxin.yu@mediatek.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On Thu, 12 Dec 2019 00:22:35 +0800, Jiaxin Yu wrote:
> From: "yong.liang" <yong.liang@mediatek.com>
> 
> Add #reset-cells property and update example
> 
> Signed-off-by: yong.liang <yong.liang@mediatek.com>
> ---
>  .../devicetree/bindings/watchdog/mtk-wdt.txt  | 10 ++++++---
>  .../reset-controller/mt2712-resets.h          | 22 +++++++++++++++++++
>  .../reset-controller/mt8183-resets.h          | 17 ++++++++++++++
>  3 files changed, 46 insertions(+), 3 deletions(-)
>  create mode 100644 include/dt-bindings/reset-controller/mt2712-resets.h
> 

Reviewed-by: Rob Herring <robh@kernel.org>
