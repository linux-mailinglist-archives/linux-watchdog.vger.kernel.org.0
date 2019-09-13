Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 21FEEB2251
	for <lists+linux-watchdog@lfdr.de>; Fri, 13 Sep 2019 16:39:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729275AbfIMOg7 (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Fri, 13 Sep 2019 10:36:59 -0400
Received: from mail-ot1-f68.google.com ([209.85.210.68]:37259 "EHLO
        mail-ot1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730708AbfIMOgS (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Fri, 13 Sep 2019 10:36:18 -0400
Received: by mail-ot1-f68.google.com with SMTP id s28so29685090otd.4;
        Fri, 13 Sep 2019 07:36:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:from:subject:references
         :in-reply-to:cc:cc:to;
        bh=XB3b5/CCYXXkmaN1QiIRHjRix0H3JE/gVYbnuNK8lOE=;
        b=YlI8Te4/zvKurHMtoHnIU/+QFGaqxyHYzBxDs5U/Ei7lG2VAuJhyCm5WWi9a/kB8gt
         eNuH0oDlqTs5+tsBHKM9OnGWDLQIY4xBTJnj2PfOS85alXeVI12V0uL6udEkBv2BEK6C
         Mszag5jiHaVjWtZt8P16OTlRvHtLVA/zcLTMX4X/Xq7CIN4IP+Vug6yK2+V9dqg2u7/V
         7BX5sh92uHZjGN3uwGKzOsZwUJPeLcr7B0sZ015Wth+6PwJgP1xHirC6O86S1dGaVJMn
         ji4EbPSmXgkOQSSp118hBvB3YqbiVehxGiTg5AywyRqTY+4O2opQhyxCyFsZQBotyqB7
         mEkQ==
X-Gm-Message-State: APjAAAV5ZkRjtijCSaajKGP53JIEC4/v4Oo6vli87O87HgRiF7kkkLVs
        UrAdFCAVaT86sEyQh3i8HQ==
X-Google-Smtp-Source: APXvYqyqPy7uITdq8aJVLYBLO1471Gvd+4ls8DvEb5HG9rjVWlRGnlaVBO1+OyBMjlBUbBpRiDoeaA==
X-Received: by 2002:a05:6830:1641:: with SMTP id h1mr18873912otr.346.1568385377538;
        Fri, 13 Sep 2019 07:36:17 -0700 (PDT)
Received: from localhost (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id w201sm1035813oie.44.2019.09.13.07.36.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Sep 2019 07:36:17 -0700 (PDT)
Message-ID: <5d7ba961.1c69fb81.d2fcd.6ff4@mx.google.com>
Date:   Fri, 13 Sep 2019 15:36:16 +0100
From:   Rob Herring <robh@kernel.org>
Subject: Re: [PATCH 2/2] dt-bindings: watchdog: Add missing clocks requirement in Samsung SoC watchdog
References: <20190907144541.16949-1-krzk@kernel.org> <20190907144541.16949-2-krzk@kernel.org>
In-Reply-To: <20190907144541.16949-2-krzk@kernel.org>
Cc:     Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Mark Rutland <mark.rutland@arm.com>,
        linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzk@kernel.org>
To:     Krzysztof Kozlowski <krzk@kernel.org>
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On Sat,  7 Sep 2019 16:45:41 +0200, Krzysztof Kozlowski wrote:
> The Samsung SoC watchdog driver always required providing a clock
> (either through platform data or from DT).  However when bindings were
> added in commit 9487a9cc7140 ("watchdog: s3c2410: Add support for device
> tree based probe"), they missed the requirement of clock.
> 
> Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
> ---
>  .../devicetree/bindings/watchdog/samsung-wdt.yaml          | 7 +++++++
>  1 file changed, 7 insertions(+)
> 

Reviewed-by: Rob Herring <robh@kernel.org>

