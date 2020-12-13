Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 57F412D8E97
	for <lists+linux-watchdog@lfdr.de>; Sun, 13 Dec 2020 17:17:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2392576AbgLMQRQ (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Sun, 13 Dec 2020 11:17:16 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38494 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730046AbgLMQRQ (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Sun, 13 Dec 2020 11:17:16 -0500
Received: from mail-oi1-x244.google.com (mail-oi1-x244.google.com [IPv6:2607:f8b0:4864:20::244])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F294CC0613CF;
        Sun, 13 Dec 2020 08:16:35 -0800 (PST)
Received: by mail-oi1-x244.google.com with SMTP id d27so16390926oic.0;
        Sun, 13 Dec 2020 08:16:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=wn3kZ9eoiz2kfwwRpuyMg/j17oBtSySw24zP5dlXSfI=;
        b=qooO/KV5EjNcitWHFP/0gcFvFLwMLFBM24mZ2h0icy1TDAuOA5x8QR1oxR3LPBfQAJ
         PUXL3SdMGXEdtvVFM0m5POCU5gi2b3FGsEyCNvWf5XaS1JBiOxXjo2tIplLYx24664n6
         FgGrVU6o6IdmjjyM/mybtmKchUJnbBdaDn7vMmOHCfBS9neOlwAkD5Aso4bmAS8S1ZGs
         wZjVsSMct1mwyfNNXaOVM/LELQphf5ipME9yifPTLGxcsyi1vkmk3fhCctiEwmKRVCST
         7NmE0g6t2GGRBESY69T3UdUuV0XnFHdu8nrhdFvkGwLNX0Iv3T7BK+NEhquXmpGZO8qt
         6LAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to:user-agent;
        bh=wn3kZ9eoiz2kfwwRpuyMg/j17oBtSySw24zP5dlXSfI=;
        b=P0B8sANdkoYKjIt7kSCp2yNXWnqiQTIFHyc4e42+XqBUe/BQ1NfWsxnPu8eTjXK4MO
         E+J0wlVkw/bD4KZH8suybgTziCoeHBoq2Di7M3RtmmK5gqunAUySqoAy2nc35KzNBF4h
         C63bEq4OdCLr4e8sb9sCJza/kewn0p3ZoZioZ5ZKOGLszX4alKOioiD4E7Lhb1OwzLSd
         74sfe5+xXFzii1BlfNAlhgQy8COIu+4t2WsVGl7z7Bs0ZgfJp1ZjAMmqVKJrYDNvp/0o
         0PzTwK+nYX4HJ3okEB6tlsnJjTi1gbllBdLulwqeRLmMZcVIqk2qhtNIP9KuVdnB/B0F
         o4CQ==
X-Gm-Message-State: AOAM530UuBB7FkyQnHu4qcWKamycIK4ARzTqRY8C7PO39rImOVn0dD/o
        F18rIG2sZA5uN760XT8elBc=
X-Google-Smtp-Source: ABdhPJzCUnsh2yzJjDGf2Ifk+qHTgOCfGhjh87nCxzS2MMtIDKjLjscKkMo+yuxozRdN4S6HI/jZhA==
X-Received: by 2002:a05:6808:3b8:: with SMTP id n24mr15263083oie.89.1607876195391;
        Sun, 13 Dec 2020 08:16:35 -0800 (PST)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id m10sm3644548oig.27.2020.12.13.08.16.34
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 13 Dec 2020 08:16:34 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Date:   Sun, 13 Dec 2020 08:16:33 -0800
From:   Guenter Roeck <linux@roeck-us.net>
To:     Johan Jonker <jbx6244@gmail.com>
Cc:     heiko@sntech.de, robh+dt@kernel.org, wim@linux-watchdog.org,
        jamie@jamieiles.com, linux-watchdog@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] dt-binding: watchdog: add Rockchip compatibles to
 snps,dw-wdt.yaml
Message-ID: <20201213161633.GA44820@roeck-us.net>
References: <20201116142539.12377-1-jbx6244@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201116142539.12377-1-jbx6244@gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On Mon, Nov 16, 2020 at 03:25:39PM +0100, Johan Jonker wrote:
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
> Reviewed-by: Rob Herring <robh@kernel.org>

Reviewed-by: Guenter Roeck <linux@roeck-us.net>

> ---
>  Documentation/devicetree/bindings/watchdog/snps,dw-wdt.yaml | 10 +++++++++-
>  1 file changed, 9 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/watchdog/snps,dw-wdt.yaml b/Documentation/devicetree/bindings/watchdog/snps,dw-wdt.yaml
> index d9fc7bb85..f7ee9229c 100644
> --- a/Documentation/devicetree/bindings/watchdog/snps,dw-wdt.yaml
> +++ b/Documentation/devicetree/bindings/watchdog/snps,dw-wdt.yaml
> @@ -14,7 +14,15 @@ maintainers:
>  
>  properties:
>    compatible:
> -    const: snps,dw-wdt
> +    oneOf:
> +      - const: snps,dw-wdt
> +      - items:
> +          - enum:
> +              - rockchip,rk3066-wdt
> +              - rockchip,rk3188-wdt
> +              - rockchip,rk3288-wdt
> +              - rockchip,rk3368-wdt
> +          - const: snps,dw-wdt
>  
>    reg:
>      maxItems: 1
