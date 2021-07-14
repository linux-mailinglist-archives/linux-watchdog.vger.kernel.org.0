Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 731303C7B3A
	for <lists+linux-watchdog@lfdr.de>; Wed, 14 Jul 2021 03:56:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237410AbhGNB7t (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Tue, 13 Jul 2021 21:59:49 -0400
Received: from mail-il1-f170.google.com ([209.85.166.170]:36806 "EHLO
        mail-il1-f170.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237374AbhGNB7s (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Tue, 13 Jul 2021 21:59:48 -0400
Received: by mail-il1-f170.google.com with SMTP id j5so27169ilk.3;
        Tue, 13 Jul 2021 18:56:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=SzFlmTgHjr8nlAUno22TBO+Fp4BVkU4LSybrQMcw7J0=;
        b=AK9ECwWuytdkOfClW8EDJ8D843P5YfQsAKe8i5RZEAuXynawYDghMb0bwoq4/FpTZJ
         mzD9GGciu/DWs/O0pwb1zjPD/SMSyD13t8WK5oEYdUPJlohhUOemG/OafIEhj2NCbiSr
         kUmD/nxkswocVi6i/Uhg6lRvoJ5cvFbukqlm83xBnEoKC1N9FoW0e0YfGVKf0qOyFpN7
         ErLd327P3yTJeBZmfDw8gvE3sOdMaW/Icq4Qv45r9uvwgu3bTCp4+0b/EQU63o3D8Tlg
         Ir3UzNfJDS6xY25Xn4Qd/MS9BcLfZHE0hsn5uTC6YdHFXQwu4LVxP1+G7+jNJTMGQjdl
         hA8A==
X-Gm-Message-State: AOAM533DMby8RniDppVvyD47LwlVg1vllduKOR6fNEMcXcMntMQ9Cdiw
        j5X9MJUTHzwMud4ag4CEkA==
X-Google-Smtp-Source: ABdhPJxrLTEdobWW2KnlKwGJQE3g45G28/p/hH4Ow2vtL2GnCFPNNi8aepfdovJ3SfMCNM1HxKx4+w==
X-Received: by 2002:a05:6e02:114e:: with SMTP id o14mr1506070ill.301.1626227816751;
        Tue, 13 Jul 2021 18:56:56 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.248])
        by smtp.gmail.com with ESMTPSA id f7sm421300ilk.64.2021.07.13.18.56.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Jul 2021 18:56:56 -0700 (PDT)
Received: (nullmailer pid 1282996 invoked by uid 1000);
        Wed, 14 Jul 2021 01:56:53 -0000
Date:   Tue, 13 Jul 2021 19:56:53 -0600
From:   Rob Herring <robh@kernel.org>
To:     Christine Zhu <Christine.Zhu@mediatek.com>
Cc:     matthias.bgg@gmail.com, linux-watchdog@vger.kernel.org,
        srv_heupstream@mediatek.com, linux@roeck-us.net,
        seiya.wang@mediatek.com, linux-mediatek@lists.infradead.org,
        robh+dt@kernel.org, linux-arm-kernel@lists.infradead.org,
        wim@linux-watchdog.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: Re: [v5,1/3] dt-bindings: mediatek: mt8195: update mtk-wdt document
Message-ID: <20210714015653.GA1282938@robh.at.kernel.org>
References: <20210628113730.26107-1-Christine.Zhu@mediatek.com>
 <20210628113730.26107-2-Christine.Zhu@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210628113730.26107-2-Christine.Zhu@mediatek.com>
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On Mon, 28 Jun 2021 19:37:29 +0800, Christine Zhu wrote:
> From: "Christine Zhu" <Christine.Zhu@mediatek.com>
> 
> Update mtk-wdt document for MT8195 platform.
> 
> Signed-off-by: Christine Zhu <Christine.Zhu@mediatek.com>
> ---
>  Documentation/devicetree/bindings/watchdog/mtk-wdt.txt | 1 +
>  1 file changed, 1 insertion(+)
> 

Acked-by: Rob Herring <robh@kernel.org>
