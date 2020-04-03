Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7559519CFFA
	for <lists+linux-watchdog@lfdr.de>; Fri,  3 Apr 2020 08:00:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732205AbgDCGAv (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Fri, 3 Apr 2020 02:00:51 -0400
Received: from mail-pl1-f193.google.com ([209.85.214.193]:38703 "EHLO
        mail-pl1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731040AbgDCGAv (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Fri, 3 Apr 2020 02:00:51 -0400
Received: by mail-pl1-f193.google.com with SMTP id w3so2300799plz.5;
        Thu, 02 Apr 2020 23:00:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=x91h2tLyTlc0iDe/5j3RCDbqB7p+b6c6m++cx7QhiU4=;
        b=Mfd0P8XlBUeT3svQWKNFphNvd7/KN1aCiN2pYOjw1C1YhI4RksEgbj2lZlCOmuVydw
         yDkQT79vAi12Q8YcmSqpuWpbWKgzJr7F8jFnYppWPUNmxH6tiwgYEXUC000cH4NHtOnc
         7BSSvrVODv1MRQNDKnevxlBOTKaSBpczQPjCAl1diwHz7RxwM8NhahytzhQWz59jPG+5
         jqsjH4bVCsuV4idpO6E8JDuGLXfWXr7Y4i9c+Q2ddSkqqHCUqcmpm8/I5qWVjvFqL2LX
         /uv7eXMl531dJJ5E4PsW70QEntYZtv6Vj+gCSVc+OHCDaOWj1yQSgn0usqigtFNmHISh
         a0Fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to:user-agent;
        bh=x91h2tLyTlc0iDe/5j3RCDbqB7p+b6c6m++cx7QhiU4=;
        b=Q1IH4/XE0z7w+ilJgtqZNL3g7AjWZkh2xc6+9l/GwlHMp2AI7k2/gNrEvVuNCyXDC5
         B6odKcdd8Rl99+gMfLT8Jzk4pa2IIeJ5PG0Dyrj3hQSq3HJx65739vWq147P2zCa8P9L
         YqFiRJ5WIZxT9B5kmwiRoYVpXD13n0HsaLkFxCWcH5DyBl2/HHmZwqRKSJ04dP6i5LiF
         52fN2IXf7m8cNuEkHNMPvYrWXDuMPmLiJWBpj9ASvAeBywebQ5x0ul0MqdfQQw5f+gYZ
         mxHNELGIwJSQpTQH++Yzc30EE6FdaHDXTSvRnE1TXRSyxholWD2r/PaAUAESlJAXaB4U
         UP7w==
X-Gm-Message-State: AGi0PuZI0c4CAeJQinc7rei9KBMMOuWwRG4FUDmo89nu+whpOUohwekV
        NT2MmSri6ib6ha/y43nVNIM=
X-Google-Smtp-Source: APiQypK8XbyWn3ZnQaFnbDolPcc04wWirWxbpBYroE8OL8s8uzDCEjQ/PWbPHv9R/8g/MsL6Oqt0pQ==
X-Received: by 2002:a17:902:7404:: with SMTP id g4mr6126025pll.69.1585893650600;
        Thu, 02 Apr 2020 23:00:50 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id h2sm5048442pfr.220.2020.04.02.23.00.49
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 02 Apr 2020 23:00:49 -0700 (PDT)
Date:   Thu, 2 Apr 2020 23:00:48 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     Evan Benn <evanbenn@chromium.org>
Cc:     LKML <linux-kernel@vger.kernel.org>, xingyu.chen@amlogic.com,
        jwerner@chromium.org,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Anson Huang <Anson.Huang@nxp.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        "David S. Miller" <davem@davemloft.net>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jonathan Cameron <Jonathan.Cameron@huawei.com>,
        Leonard Crestez <leonard.crestez@nxp.com>,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Olof Johansson <olof@lixom.net>, Rob Herring <robh@kernel.org>,
        Shawn Guo <shawnguo@kernel.org>,
        Valentin Schneider <valentin.schneider@arm.com>,
        Vinod Koul <vkoul@kernel.org>, Will Deacon <will@kernel.org>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, linux-watchdog@vger.kernel.org
Subject: Re: [PATCH v2 2/2] watchdog: Add new arm_smd_wdt watchdog driver
Message-ID: <20200403060048.GA206691@roeck-us.net>
References: <20200403052900.258855-1-evanbenn@chromium.org>
 <20200403162742.v2.2.Ia92bb4d4ce84bcefeba1d00aaa1c1e919b6164ef@changeid>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200403162742.v2.2.Ia92bb4d4ce84bcefeba1d00aaa1c1e919b6164ef@changeid>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On Fri, Apr 03, 2020 at 04:29:00PM +1100, Evan Benn wrote:
> From: Julius Werner <jwerner@chromium.org>
> 
> This patch adds a watchdog driver that can be used on ARM systems
> with the appropriate watchdog implemented in Secure Monitor firmware.
> The driver communicates with firmware via a Secure Monitor Call.
> This may be useful for platforms using TrustZone that want
> the Secure Monitor firmware to have the final control over the watchdog.
> 
> This is implemented on mt8173 chromebook devices oak, elm and hana in
> arm trusted firmware file plat/mediatek/mt8173/drivers/wdt/wdt.c.
> 
> Signed-off-by: Julius Werner <jwerner@chromium.org>
> Signed-off-by: Evan Benn <evanbenn@chromium.org>

Reviewed-by: Guenter Roeck <linux@roeck-us.net>

Guenter
