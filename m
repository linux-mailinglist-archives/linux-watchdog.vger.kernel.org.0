Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4A1952AFC1A
	for <lists+linux-watchdog@lfdr.de>; Thu, 12 Nov 2020 02:32:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728335AbgKLBcQ (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Wed, 11 Nov 2020 20:32:16 -0500
Received: from mail-ot1-f66.google.com ([209.85.210.66]:40265 "EHLO
        mail-ot1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727208AbgKKWqr (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Wed, 11 Nov 2020 17:46:47 -0500
Received: by mail-ot1-f66.google.com with SMTP id 79so3734707otc.7;
        Wed, 11 Nov 2020 14:46:46 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=ovjuYpK3EP3le4I+6kyRLcFO520+SrwarL+k5ndBek4=;
        b=hx/oSsIcCSKRt7QpWc3Gg6sDsW8/b+ez0O59FpVli7UM9aJ9KKHdwxg56MkUCSdVo4
         ESns13hzt9cOaBqhsxms3m3RTUWEcnmtkw6w4EwlvbPVjR/HHW8J7taXSBgkmI28gJkT
         G783prKvoG4+3T7Lb92AXm7qeHTSBFkvQR5Wgtr0xpTwa0EkFn6SaiyBVC4JQIhYCPvY
         IMy+/kKdkLJM44ForEvdLXfwJtVdX0cLCWgH8iWnFwJtlAB4+qO0HldiorWgaMW/VuAr
         oaVcZiS38GmrNzwWIbUHGY+OHu3a1LtJ/FPDy1/fUIDVfp6RVDshCom5z0BNPIg0lacI
         fd0A==
X-Gm-Message-State: AOAM532ZhHLgbXZB8/Fc24/qleY/Edfb9W1Cg5xRQnWrES4Vp44KlidO
        wiXC90MyAEB3sMj/AENkeSVoDCwqCQ==
X-Google-Smtp-Source: ABdhPJw8ibM/KJmRUHsGkKkZrYQTik4Shkm6eDSroKGVzLcpiMpLaWzgIDOjuwVjC1z6AuuomH4KAg==
X-Received: by 2002:a05:6830:2ef:: with SMTP id r15mr19751736ote.261.1605134806518;
        Wed, 11 Nov 2020 14:46:46 -0800 (PST)
Received: from xps15 (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id j16sm853011oot.24.2020.11.11.14.46.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2020 14:46:45 -0800 (PST)
Received: (nullmailer pid 2184985 invoked by uid 1000);
        Wed, 11 Nov 2020 22:46:45 -0000
Date:   Wed, 11 Nov 2020 16:46:45 -0600
From:   Rob Herring <robh@kernel.org>
To:     Frank Lee <frank@allwinnertech.com>
Cc:     Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        tiny.windzz@gmail.com, Maxime Ripard <mripard@kernel.org>,
        linux-arm-kernel@lists.infradead.org,
        Rob Herring <robh+dt@kernel.org>,
        linux-watchdog@vger.kernel.org, Chen-Yu Tsai <wens@csie.org>
Subject: Re: [RESEND PATCH 10/19] dt-bindings: watchdog: sun4i: Add A100
 compatible
Message-ID: <20201111224645.GA2184935@bogus>
References: <cover.1604988979.git.frank@allwinnertech.com>
 <cd080363346d5019658afecfb251b019b4e25049.1604988979.git.frank@allwinnertech.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cd080363346d5019658afecfb251b019b4e25049.1604988979.git.frank@allwinnertech.com>
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On Tue, 10 Nov 2020 14:36:48 +0800, Frank Lee wrote:
> From: Yangtao Li <frank@allwinnertech.com>
> 
> Add a binding for A100's watchdog controller.
> 
> Signed-off-by: Yangtao Li <frank@allwinnertech.com>
> ---
>  .../devicetree/bindings/watchdog/allwinner,sun4i-a10-wdt.yaml  | 3 +++
>  1 file changed, 3 insertions(+)
> 

Acked-by: Rob Herring <robh@kernel.org>
