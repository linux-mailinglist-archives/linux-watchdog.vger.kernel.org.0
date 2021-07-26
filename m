Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 40D8F3D6970
	for <lists+linux-watchdog@lfdr.de>; Tue, 27 Jul 2021 00:23:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233491AbhGZVnY (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Mon, 26 Jul 2021 17:43:24 -0400
Received: from mail-il1-f179.google.com ([209.85.166.179]:45821 "EHLO
        mail-il1-f179.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233162AbhGZVnY (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Mon, 26 Jul 2021 17:43:24 -0400
Received: by mail-il1-f179.google.com with SMTP id z3so10408061ile.12;
        Mon, 26 Jul 2021 15:23:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=dOz5E7HVjFqVAWLA76t/vpT1NocpXtD+l9AS40cwRw8=;
        b=I8hu8FRz5oY86XT0fodKstX8itf4QO+qq7ROTXbhVeRGRjFKC3cSF3aq62a759KEQr
         3kQF0emAL7g+UOnHME4qRK4V+i76VDD+o9w+Pm9j8iPnGj+w2QsKnnhfbKcOV1oZfoEY
         OEV2zKKrkdZMUk7WIaq/W26cNw4UAtyjvcU78/1sBswtc1u2BCXJ5PS2kCW9M1YgwPsQ
         tJMGxGp5cK+fm9yjdonz0nR6ugD8b1GNKoT2VQbjvWGgyO96Kn93T+Jn0kIMAI34xSBL
         hRnRDOb5QHcyRbbuuLcSLQB+52RClRLHRvC5pmtJ5gAj61LftLxL4jjulfyPtwCtZzv6
         xyxw==
X-Gm-Message-State: AOAM5316JNmoG6883nLBLLJ5AqPWMDJeXmCOaalI0c9+rQqoTMsc/FeB
        +9ChdAOGlFblOndzmQRAnQ==
X-Google-Smtp-Source: ABdhPJwSP3kbL1KH7zx/6aZ6tXF7AlLcNfp88AXqdvjydYHLaRjr1AFxmSBakwlvWBCPEYgunztqPg==
X-Received: by 2002:a92:de0a:: with SMTP id x10mr14678766ilm.215.1627338231045;
        Mon, 26 Jul 2021 15:23:51 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.248])
        by smtp.gmail.com with ESMTPSA id v14sm689132ioh.11.2021.07.26.15.23.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Jul 2021 15:23:50 -0700 (PDT)
Received: (nullmailer pid 980634 invoked by uid 1000);
        Mon, 26 Jul 2021 22:23:45 -0000
Date:   Mon, 26 Jul 2021 16:23:45 -0600
From:   Rob Herring <robh@kernel.org>
To:     Christine Zhu <Christine.Zhu@mediatek.com>
Cc:     linux-mediatek@lists.infradead.org, robh+dt@kernel.org,
        linux@roeck-us.net, linux-arm-kernel@lists.infradead.org,
        linux-watchdog@vger.kernel.org, seiya.wang@mediatek.com,
        matthias.bgg@gmail.com, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, srv_heupstream@mediatek.com,
        wim@linux-watchdog.org
Subject: Re: [v7,2/3] dt-bindings: reset: mt8195: add toprgu reset-controller
 header file
Message-ID: <20210726222345.GA980575@robh.at.kernel.org>
References: <20210726122901.12195-1-Christine.Zhu@mediatek.com>
 <20210726122901.12195-3-Christine.Zhu@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210726122901.12195-3-Christine.Zhu@mediatek.com>
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On Mon, 26 Jul 2021 20:29:01 +0800, Christine Zhu wrote:
> Add toprgu reset-controller header file for MT8195 platform.
> 
> Signed-off-by: Christine Zhu <Christine.Zhu@mediatek.com>
> ---
>  include/dt-bindings/reset/mt8195-resets.h | 29 +++++++++++++++++++++++
>  1 file changed, 29 insertions(+)
>  create mode 100644 include/dt-bindings/reset/mt8195-resets.h
> 

Acked-by: Rob Herring <robh@kernel.org>
