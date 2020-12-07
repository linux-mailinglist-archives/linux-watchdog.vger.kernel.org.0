Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 294292D198F
	for <lists+linux-watchdog@lfdr.de>; Mon,  7 Dec 2020 20:32:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725995AbgLGTbg (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Mon, 7 Dec 2020 14:31:36 -0500
Received: from mail-ot1-f67.google.com ([209.85.210.67]:36745 "EHLO
        mail-ot1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725947AbgLGTbf (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Mon, 7 Dec 2020 14:31:35 -0500
Received: by mail-ot1-f67.google.com with SMTP id y24so13623407otk.3;
        Mon, 07 Dec 2020 11:31:20 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=qSvS8Ee1wuNKfsrbfYX/ii4mmEZIAWZ9Jce3aen8hjE=;
        b=sIFQgATaEuX7r0Xi/j6XeiKr9Z9W+2ddkc0CkAXnbe7a7PXkhmPO6+qkS+uq9A3E0h
         Gg6bHhYzz/QtYoW4AAy/YSrPS8Mat+EKSVYGQQKhtyBMWhN7t7+diLH64tHeyghWo4Cp
         WkeTjoEHWb68SW3HOroag/OX2O0DpEwvPF6OjFG2kpOasr/wXnCnZaZc314LRHA1OU0s
         TFeJTrmVU1aVo49zFsle9EoZUd/j6v0qk38h08ZpNJHSy4ndctTbMWtR0HMoC8IBBSXQ
         Ss9hZ/eDrgcuje+GRLRbbh3G+XtfpDdeXaY98kt/yKDOCmdGwJcnOVdQf1KP8qWKJe+x
         jiQA==
X-Gm-Message-State: AOAM532mMc6LSA3W5NK9sJxxnePsrtSS3rP+OehV2IXoXs29H++1sW3d
        sMXtmGT+P7/akaksW2rgmg==
X-Google-Smtp-Source: ABdhPJzHitdh//srQXFXNXFhwKtiauLvAaU55joyn4ufC6poP/o/TLOP8OCvBzH8Pzq0M0kYer9D/g==
X-Received: by 2002:a9d:6b0a:: with SMTP id g10mr655604otp.20.1607369454709;
        Mon, 07 Dec 2020 11:30:54 -0800 (PST)
Received: from xps15 (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id r25sm832117otp.23.2020.12.07.11.30.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Dec 2020 11:30:53 -0800 (PST)
Received: (nullmailer pid 672557 invoked by uid 1000);
        Mon, 07 Dec 2020 19:30:52 -0000
Date:   Mon, 7 Dec 2020 13:30:52 -0600
From:   Rob Herring <robh@kernel.org>
To:     Johan Jonker <jbx6244@gmail.com>
Cc:     robh+dt@kernel.org, heiko@sntech.de, jamie@jamieiles.com,
        linux-arm-kernel@lists.infradead.org,
        linux-watchdog@vger.kernel.org, linux-rockchip@lists.infradead.org,
        linux@roeck-us.net, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, wim@linux-watchdog.org
Subject: Re: [PATCH] dt-binding: watchdog: add Rockchip compatibles to snps,
 dw-wdt.yaml
Message-ID: <20201207193052.GA672527@robh.at.kernel.org>
References: <20201116142539.12377-1-jbx6244@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201116142539.12377-1-jbx6244@gmail.com>
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On Mon, 16 Nov 2020 15:25:39 +0100, Johan Jonker wrote:
> The Rockchip watchdog compatibles below are already in use,
> but somehow never added to a document,
> so add them to the snps,dw-wdt.yaml file.
> 
> "rockchip,rk3066-wdt", "snps,dw-wdt"
> "rockchip,rk3188-wdt", "snps,dw-wdt"
> "rockchip,rk3288-wdt", "snps,dw-wdt"
> "rockchip,rk3368-wdt", "snps,dw-wdt"
> 
> make ARCH=arm dtbs_check
> DT_SCHEMA_FILES=Documentation/devicetree/bindings/watchdog/snps,dw-wdt.yaml
> 
> make ARCH=arm64 dtbs_check
> DT_SCHEMA_FILES=Documentation/devicetree/bindings/watchdog/snps,dw-wdt.yaml
> 
> Signed-off-by: Johan Jonker <jbx6244@gmail.com>
> ---
>  Documentation/devicetree/bindings/watchdog/snps,dw-wdt.yaml | 10 +++++++++-
>  1 file changed, 9 insertions(+), 1 deletion(-)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
