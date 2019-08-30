Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 65CE6A3C76
	for <lists+linux-watchdog@lfdr.de>; Fri, 30 Aug 2019 18:48:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727930AbfH3QsO (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Fri, 30 Aug 2019 12:48:14 -0400
Received: from mail-pf1-f195.google.com ([209.85.210.195]:35201 "EHLO
        mail-pf1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727883AbfH3QsO (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Fri, 30 Aug 2019 12:48:14 -0400
Received: by mail-pf1-f195.google.com with SMTP id 205so2527711pfw.2;
        Fri, 30 Aug 2019 09:48:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=Nhls23xbDGnUOtZmZSQGkaRaqazmjQF4wx/66py5COg=;
        b=k1b2yLM03jtlRLdZJ2CwcVaSEEi2pqzP7rpWfJHtUuzEV1Ll1CC1VHBINbmYGCGAlI
         zNxKUWJySUl8InbCuar/A+adgfGuqB8VHLJ09EY4/uYlH5I+XZCQ480u/VIazt8jNoBD
         R7Azfoc5abhzygYcDYQRU6NPcA4YSSqaFsGPS59i28XL9gZCbHhbd57jcKnw01XmUep1
         7YMP0e22/FFl1+XoQ6E+aYH1Cp64Z+rcZ0ZBolXa9p+zOqt5uCpiox5iSHrLfgLqTxOB
         lCd2cRLW5HgU7TKA85U6mOwx5Kov+B78l7tZJb0unD3af03ZxBpikURZse8EQ7Zh7Cna
         IT+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to:user-agent;
        bh=Nhls23xbDGnUOtZmZSQGkaRaqazmjQF4wx/66py5COg=;
        b=EiaRoL0T3rYJF0DEM9MYBZpdN95Xp0VotZXzjTMofL+bnwUUUoDoTZIYk751uwGaap
         NQQvv0p2xU7Wgb5vxwN2aeGWo6qCrqWFh8cbZmb2qrBKkh7VV4sJYChiExwSVmbLhZGU
         26YrlA0JOjhDIfGkgg+0vtHPhKMRFZ5+QkebF1wj/tNFp5tIUoEmHaigUcUhEu1XEz4d
         f38AQRz26dOfY/h+blC+MNSLUNzHg7MINCAWLgwYEcmVEf5xYyjWWk21PTziTBVGEdwq
         OvIYgga2xx1IZihhfiWpXdlvHJk3hg0E1m38EZICzzPDO58eGDj1LhoFXDylssIEzVC7
         rH6g==
X-Gm-Message-State: APjAAAU1EKazI6VaQMLnOGyWb2JjchPD0DabKgrVi3FMcs2nb+X/hy5b
        R35z904pOLWoWXSVC1UIpp0=
X-Google-Smtp-Source: APXvYqxp+u7C0npib0ee3GaNBuW/2YaLw8oR/aYYj79MXLdN+1c2/iBCEju/bL1wN4sctbwys6W+VA==
X-Received: by 2002:a62:8204:: with SMTP id w4mr4612864pfd.30.1567183693830;
        Fri, 30 Aug 2019 09:48:13 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id a128sm9867876pfb.185.2019.08.30.09.48.11
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 30 Aug 2019 09:48:12 -0700 (PDT)
Date:   Fri, 30 Aug 2019 09:48:11 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     Maxime Ripard <mripard@kernel.org>
Cc:     wim@linux-watchdog.org, linux-kernel@vger.kernel.org,
        Chen-Yu Tsai <wens@csie.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Rob Herring <robh+dt@kernel.org>,
        Frank Rowand <frowand.list@gmail.com>,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        linux-watchdog@vger.kernel.org
Subject: Re: [PATCH RESEND v2 1/6] dt-bindings: watchdog: Add YAML schemas
 for the generic watchdog bindings
Message-ID: <20190830164811.GA7911@roeck-us.net>
References: <20190821143835.7294-1-mripard@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190821143835.7294-1-mripard@kernel.org>
User-Agent: Mutt/1.5.24 (2015-08-30)
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On Wed, Aug 21, 2019 at 04:38:30PM +0200, Maxime Ripard wrote:
> From: Maxime Ripard <maxime.ripard@bootlin.com>
> 
> The watchdogs have a bunch of generic properties that are needed in a
> device tree. Add a YAML schemas for those.
> 
> Reviewed-by: Rob Herring <robh@kernel.org>
> Signed-off-by: Maxime Ripard <maxime.ripard@bootlin.com>

Reviewed-by: Guenter Roeck <linux@roeck-us.net>

> 
> ---
> 
> Changes from v1:
>   - New patch
> ---
>  .../bindings/watchdog/watchdog.yaml           | 26 +++++++++++++++++++
>  1 file changed, 26 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/watchdog/watchdog.yaml
> 
> diff --git a/Documentation/devicetree/bindings/watchdog/watchdog.yaml b/Documentation/devicetree/bindings/watchdog/watchdog.yaml
> new file mode 100644
> index 000000000000..187bf6cb62bf
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/watchdog/watchdog.yaml
> @@ -0,0 +1,26 @@
> +# SPDX-License-Identifier: GPL-2.0
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/watchdog/watchdog.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Watchdog Generic Bindings
> +
> +maintainers:
> +  - Guenter Roeck <linux@roeck-us.net>
> +  - Wim Van Sebroeck <wim@linux-watchdog.org>
> +
> +description: |
> +  This document describes generic bindings which can be used to
> +  describe watchdog devices in a device tree.
> +
> +properties:
> +  $nodename:
> +    pattern: "^watchdog(@.*|-[0-9a-f])?$"
> +
> +  timeout-sec:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    description:
> +      Contains the watchdog timeout in seconds.
> +
> +...
> -- 
> 2.21.0
> 
