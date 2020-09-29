Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F13E127D1E3
	for <lists+linux-watchdog@lfdr.de>; Tue, 29 Sep 2020 16:53:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729721AbgI2OxW (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Tue, 29 Sep 2020 10:53:22 -0400
Received: from mail-ot1-f66.google.com ([209.85.210.66]:44468 "EHLO
        mail-ot1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727328AbgI2OxW (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Tue, 29 Sep 2020 10:53:22 -0400
Received: by mail-ot1-f66.google.com with SMTP id a2so4671510otr.11;
        Tue, 29 Sep 2020 07:53:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=Rvja7UAx5LjxNIXrk+u593vmL/usEajExGbX7/fKE+0=;
        b=mZYAmYI+iiHpohdXmoGTiWpvtqvMduyMxeigWa+R/XPBtFCnOjx7DF0RfLptL5FvIR
         oAnIOtAcNx9Prg3M5NEC0k2Jk6lQ74r9b4pGXtuAbgEwpcJ8BHNc9DVwIMZjyCP8v9gd
         CziLEVCGDXf/aJ+3DUxSwoU/KDfgajpIoxCl3r/cF0A8yyPMJQLNIkPjPirsoFL22gwi
         1UNFvJqgZX5WXneBA/C7TwYgTEwkww4sAcAv3MXzdIIKdf6szp8kpLJRci/b5Odleqp8
         mscjhW9pgvo+sMg0vSGpJlCGtCI9TsuzIcTAi2wRhsGuU+ULGfakZp8bDirbMqiW+J7Z
         YVBA==
X-Gm-Message-State: AOAM533ofMNhogC4sse2rnJBv7IZYJuTG+eoAm4TPbkR/uLSQW/0AryG
        UeqRzrR/9nG5aqz5zGmAew==
X-Google-Smtp-Source: ABdhPJwIET4C0nxWL8gE1hkKLCvBgCVpPpnIwFGNqDoKTJttXb4uXp3Kaa0d9N2tBjqVkMfIbkFy6g==
X-Received: by 2002:a05:6830:110b:: with SMTP id w11mr2859417otq.109.1601391201417;
        Tue, 29 Sep 2020 07:53:21 -0700 (PDT)
Received: from xps15 (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id p1sm1036861otq.7.2020.09.29.07.53.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2020 07:53:20 -0700 (PDT)
Received: (nullmailer pid 575408 invoked by uid 1000);
        Tue, 29 Sep 2020 14:53:19 -0000
Date:   Tue, 29 Sep 2020 09:53:19 -0500
From:   Rob Herring <robh@kernel.org>
To:     Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
Cc:     devicetree@vger.kernel.org, linux-power@fi.rohmeurope.com,
        Lee Jones <lee.jones@linaro.org>, linux-kernel@vger.kernel.org,
        linux-watchdog@vger.kernel.org, mazziesaccount@gmail.com,
        Rob Herring <robh+dt@kernel.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Wim Van Sebroeck <wim@linux-watchdog.org>
Subject: Re: [PATCH v3 1/4] dt_bindings: mfd: Add ROHM BD9576MUF and
 BD9573MUF PMICs
Message-ID: <20200929145319.GA575227@bogus>
References: <cover.1601366711.git.matti.vaittinen@fi.rohmeurope.com>
 <be3518afb2a54ff02ca15e63cac21c99bcdfaef6.1601366711.git.matti.vaittinen@fi.rohmeurope.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <be3518afb2a54ff02ca15e63cac21c99bcdfaef6.1601366711.git.matti.vaittinen@fi.rohmeurope.com>
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On Tue, 29 Sep 2020 11:15:31 +0300, Matti Vaittinen wrote:
> Add bindings for ROHM BD9576MUF and BD9573MUF PMICs. These
> PMICs are primarily intended to be used to power the R-Car series
> processors. They provide 6 power outputs, safety features and a
> watchdog with two functional modes.
> 
> Signed-off-by: Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
> ---
> 
> Changes from v2:
>   - Replace bindings hw_margin_ms and rohm,hw-margin-min-ms with
>     rohm,hw-timeout-ms
> 
>  .../bindings/mfd/rohm,bd9576-pmic.yaml        | 123 ++++++++++++++++++
>  1 file changed, 123 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/mfd/rohm,bd9576-pmic.yaml
> 

Reviewed-by: Rob Herring <robh@kernel.org>
