Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 445FF2C60E5
	for <lists+linux-watchdog@lfdr.de>; Fri, 27 Nov 2020 09:35:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727913AbgK0Icq (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Fri, 27 Nov 2020 03:32:46 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34588 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727486AbgK0Icq (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Fri, 27 Nov 2020 03:32:46 -0500
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com [IPv6:2a00:1450:4864:20::342])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EE23EC0613D4
        for <linux-watchdog@vger.kernel.org>; Fri, 27 Nov 2020 00:32:45 -0800 (PST)
Received: by mail-wm1-x342.google.com with SMTP id 1so5708626wme.3
        for <linux-watchdog@vger.kernel.org>; Fri, 27 Nov 2020 00:32:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=eAdalm4QHc9hAmDG/xOUAcKIOz0SCKnJUjFdQgtGIsQ=;
        b=Wq0s8zBftW/RgJ+9EJq3lrsGXgIq0Ey5tY4hA3KR6BbQNTNKY93Acig8eR1C7dCkid
         iR8RULncWs2A0qGCnLxPiTWmRHBM5bDXNl6T1Syl3zVU2jYBOVWzW+ZKRck5I1tBRxWs
         Ghuht/XT+k+gHrg19fBtv+eyVYbKEfcZjIDif/l1HkPNoCCov5+DgJyeymtO9WGa75Gw
         6LGlzC2eaqN6qlJ/CsAdcWmssQdNB5Dsr8r0fswg6BUon6N2ZD0Ul315nrpzEYsu/f+V
         4wzZHWHtZceljWDkHmd9xMDMUy4hSum4Oa4GQ+vVmVFvJRm2IWpTWvZFKEIvZprzH+g4
         mn+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=eAdalm4QHc9hAmDG/xOUAcKIOz0SCKnJUjFdQgtGIsQ=;
        b=VWixBJpMKMGMpYF7IHj9/umS1eGSYvUXaYNKqqD/Pqyh1GqR5XRk0G6/kyNF8O0CsZ
         dx+iMi3TmIEuKH7w9W+LSsrfPELij0Mj7Cpyg/Fh6PL0hVCozQOltA+i17vnGCsHq2AY
         i/CQmo2HeCTkaY/ePJkMC01t3XyeXJgrFvCHsEsKJSxYOlC/QCyoyRYb9oI3KxYR6hQP
         v+2x5Qps82wRFMfJ0su0DJkc1E0beqNwPDJHRrOQx/IZ7bZr5isrgibY4eacwpXACZV9
         rU/6UfUjI69xOZOHjUf/WubDFiJOGFmk9JuGLIxZ4cacdWU5/WKKD8i8O2+Akh6OFrLO
         4xtw==
X-Gm-Message-State: AOAM532dsSEuz6spJsXlq4T7H+3dedebhrSmv9ITTr3Wa1XIrq2TJN1Z
        pNkF7k8fXbEWOfaoVaD1vpcMBA==
X-Google-Smtp-Source: ABdhPJwi040KwhQPzoYDENnmMcnuFP/231E5ZtxqzU/8uZay0K6yX1s6Z8Cs55dc2kCY2vohc8aRoQ==
X-Received: by 2002:a05:600c:2314:: with SMTP id 20mr3641698wmo.92.1606465964655;
        Fri, 27 Nov 2020 00:32:44 -0800 (PST)
Received: from dell ([91.110.221.235])
        by smtp.gmail.com with ESMTPSA id w15sm13402265wrp.52.2020.11.27.00.32.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2020 00:32:43 -0800 (PST)
Date:   Fri, 27 Nov 2020 08:32:42 +0000
From:   Lee Jones <lee.jones@linaro.org>
To:     Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
Cc:     mazziesaccount@gmail.com, Rob Herring <robh+dt@kernel.org>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-power@fi.rohmeurope.com,
        linux-watchdog@vger.kernel.org
Subject: Re: [PATCH RESEND v6 2/4] mfd: Support ROHM BD9576MUF and BD9573MUF
Message-ID: <20201127083242.GK2455276@dell>
References: <cover.1605882179.git.matti.vaittinen@fi.rohmeurope.com>
 <cc46e329efa30c66f000ab7c97f9bbf0bc31f0f7.1605882179.git.matti.vaittinen@fi.rohmeurope.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <cc46e329efa30c66f000ab7c97f9bbf0bc31f0f7.1605882179.git.matti.vaittinen@fi.rohmeurope.com>
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On Mon, 23 Nov 2020, Matti Vaittinen wrote:

> Add core support for ROHM BD9576MUF and BD9573MUF PMICs which are
> mainly used to power the R-Car series processors.
> 
> Signed-off-by: Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
> ---
>  drivers/mfd/Kconfig              |  11 ++++
>  drivers/mfd/Makefile             |   1 +
>  drivers/mfd/rohm-bd9576.c        | 108 +++++++++++++++++++++++++++++++
>  include/linux/mfd/rohm-bd957x.h  |  59 +++++++++++++++++
>  include/linux/mfd/rohm-generic.h |   2 +
>  5 files changed, 181 insertions(+)
>  create mode 100644 drivers/mfd/rohm-bd9576.c
>  create mode 100644 include/linux/mfd/rohm-bd957x.h

Looks like a possible candidate for "simple-mfd-i2c".

Could you look into that please?

-- 
Lee Jones [李琼斯]
Senior Technical Lead - Developer Services
Linaro.org │ Open source software for Arm SoCs
Follow Linaro: Facebook | Twitter | Blog
