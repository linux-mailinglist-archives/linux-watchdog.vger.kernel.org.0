Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1D80985287
	for <lists+linux-watchdog@lfdr.de>; Wed,  7 Aug 2019 19:59:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388207AbfHGR7p (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Wed, 7 Aug 2019 13:59:45 -0400
Received: from mail-pl1-f194.google.com ([209.85.214.194]:36669 "EHLO
        mail-pl1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387953AbfHGR7p (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Wed, 7 Aug 2019 13:59:45 -0400
Received: by mail-pl1-f194.google.com with SMTP id k8so41941271plt.3;
        Wed, 07 Aug 2019 10:59:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=Ng6xzoejdEmB6bEu6I8V9VsO/8EgPH3m7FsrYidIs9U=;
        b=PJUT3jDPkZBHoMReYOZ90wqru2WmbuqSeaiKUYBfJSzLLddji9y1+lo7MG3H/v3MHI
         X64701CtrJr9jGEFNXdJWD6zxWrrM6m77kSRt9xQhxI3AdzSCTpXE/ImRE8vUrmfDaTt
         vJmtJaMljNtGdVXtpratOJdIcUIhYbNJuziKN0R7Gp94W4Bk9Qqs96oPoR4/zgBP5/G3
         W4moh+AeYd1yecIbW5ZYxLsgYcdxqcvvELrdP6I/e/+LE6kw4+8j3SPcaOyl/b4mzYKD
         oNcm58YoLsd6gx+vD1Q64Pot5N5mYpeT3wTySLEGmSNvxaShEtaKCd3aTiUaNGKipee/
         mKbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to:user-agent;
        bh=Ng6xzoejdEmB6bEu6I8V9VsO/8EgPH3m7FsrYidIs9U=;
        b=bnW8pK2v4E/0s11G3A7Cqrl+GIJDn7wPc+9D4zLyNsQvlmvAGGv+CJNi1A+od/MsE7
         py29u3vK+DusCyDXM+Em2zajVhuAqzSVjDLGi4JGuenwEtB9fiR7oY0GsYZ9GJOTqZZs
         CiSr/3XCIJVOIQHa+8rZ15G2Mp14YHuj53mexQecmaUhpQOEg1mufcieHtzTUPOtbu29
         UviwmetvWps+Q6quneEBRceD63hMuCKoTqSJuz0J+9KhpMNB35G6QJ+5FJAeIKiiz1Nm
         sFpUQHOwCXAlglu7XSRErYqbChlt3HxIBijKo0g/XPFdaLr0fEVBXUatq1UAwMN15Xs2
         3YoQ==
X-Gm-Message-State: APjAAAUmyYCMx5Ha+Leod8iDvDv5LJOpjRTI0PXywpHc/ulh1Up/Hzw7
        SyTc9nkYKjxocgaa/K58+G0=
X-Google-Smtp-Source: APXvYqw+aPcdft4eNHEsQckq4s+4Z5jgKpCx7EjtIxho9e8VbTKoeh7Lgrtix37xUJEpn6vv3crhWA==
X-Received: by 2002:a65:62d7:: with SMTP id m23mr8765206pgv.358.1565200784513;
        Wed, 07 Aug 2019 10:59:44 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id w18sm120988761pfj.37.2019.08.07.10.59.43
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 07 Aug 2019 10:59:43 -0700 (PDT)
Date:   Wed, 7 Aug 2019 10:59:42 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     Neil Armstrong <narmstrong@baylibre.com>
Cc:     robh+dt@kernel.org, linux-amlogic@lists.infradead.org,
        linux-watchdog@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org
Subject: Re: [RFCv2 9/9] dt-bindings: watchdog: meson-gxbb-wdt: convert to
 yaml
Message-ID: <20190807175942.GA26331@roeck-us.net>
References: <20190805120320.32282-1-narmstrong@baylibre.com>
 <20190805120320.32282-10-narmstrong@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190805120320.32282-10-narmstrong@baylibre.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On Mon, Aug 05, 2019 at 02:03:20PM +0200, Neil Armstrong wrote:
> Now that we have the DT validation in place, let's convert the device tree
> bindings for the Amlogic GXBB Watchdog timer over to a YAML schemas.
> 
> Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>

Reviewed-by: Guenter Roeck <linux@roeck-us.net>

> ---
>  .../watchdog/amlogic,meson-gxbb-wdt.yaml      | 37 +++++++++++++++++++
>  .../bindings/watchdog/meson-gxbb-wdt.txt      | 16 --------
>  2 files changed, 37 insertions(+), 16 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/watchdog/amlogic,meson-gxbb-wdt.yaml
>  delete mode 100644 Documentation/devicetree/bindings/watchdog/meson-gxbb-wdt.txt
> 
> diff --git a/Documentation/devicetree/bindings/watchdog/amlogic,meson-gxbb-wdt.yaml b/Documentation/devicetree/bindings/watchdog/amlogic,meson-gxbb-wdt.yaml
> new file mode 100644
> index 000000000000..d7352f709b37
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/watchdog/amlogic,meson-gxbb-wdt.yaml
> @@ -0,0 +1,37 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +# Copyright 2019 BayLibre, SAS
> +%YAML 1.2
> +---
> +$id: "http://devicetree.org/schemas/watchdog/amlogic,meson-gxbb-wdt.yaml#"
> +$schema: "http://devicetree.org/meta-schemas/core.yaml#"
> +
> +title: Meson GXBB SoCs Watchdog timer
> +
> +maintainers:
> +  - Neil Armstrong <narmstrong@baylibre.com>
> +
> +properties:
> +  compatible:
> +    enum:
> +      - amlogic,meson-gxbb-wdt
> +
> +  reg:
> +    maxItems: 1
> +
> +  clocks:
> +    maxItems: 1
> +    description:
> +      A phandle to the clock of this PHY
> +
> +required:
> +  - compatible
> +  - reg
> +  - clocks
> +
> +examples:
> +  - |
> +    watchdog@98d0 {
> +          compatible = "amlogic,meson-gxbb-wdt";
> +          reg = <0x98d0 0x10>;
> +          clocks = <&xtal>;
> +    };
> diff --git a/Documentation/devicetree/bindings/watchdog/meson-gxbb-wdt.txt b/Documentation/devicetree/bindings/watchdog/meson-gxbb-wdt.txt
> deleted file mode 100644
> index c7fe36fa739c..000000000000
> --- a/Documentation/devicetree/bindings/watchdog/meson-gxbb-wdt.txt
> +++ /dev/null
> @@ -1,16 +0,0 @@
> -Meson GXBB SoCs Watchdog timer
> -
> -Required properties:
> -
> -- compatible : should be "amlogic,meson-gxbb-wdt"
> -- reg : Specifies base physical address and size of the registers.
> -- clocks : Should be a phandle to the Watchdog clock source, for GXBB the xtal
> -	   is the default clock source.
> -
> -Example:
> -
> -wdt: watchdog@98d0 {
> -	compatible = "amlogic,meson-gxbb-wdt";
> -	reg = <0 0x98d0 0x0 0x10>;
> -	clocks = <&xtal>;
> -};
