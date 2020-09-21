Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F2A13271C32
	for <lists+linux-watchdog@lfdr.de>; Mon, 21 Sep 2020 09:42:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726347AbgIUHmm (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Mon, 21 Sep 2020 03:42:42 -0400
Received: from mo-csw-fb1516.securemx.jp ([210.130.202.172]:59112 "EHLO
        mo-csw-fb.securemx.jp" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726236AbgIUHmm (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Mon, 21 Sep 2020 03:42:42 -0400
Received: by mo-csw-fb.securemx.jp (mx-mo-csw-fb1516) id 08L7RxEL002917; Mon, 21 Sep 2020 16:27:59 +0900
Received: by mo-csw.securemx.jp (mx-mo-csw1515) id 08L7RTue026732; Mon, 21 Sep 2020 16:27:29 +0900
X-Iguazu-Qid: 34trqPsSB6I7gOKGUT
X-Iguazu-QSIG: v=2; s=0; t=1600673249; q=34trqPsSB6I7gOKGUT; m=5e4VanAcPpnma4UfjZ5ipW49cMuzTQC+X4faG4aBgKQ=
Received: from imx2.toshiba.co.jp (imx2.toshiba.co.jp [106.186.93.51])
        by relay.securemx.jp (mx-mr1512) id 08L7RSqk018165;
        Mon, 21 Sep 2020 16:27:28 +0900
Received: from enc01.toshiba.co.jp ([106.186.93.100])
        by imx2.toshiba.co.jp  with ESMTP id 08L7RRBa020461;
        Mon, 21 Sep 2020 16:27:27 +0900 (JST)
Received: from hop001.toshiba.co.jp ([133.199.164.63])
        by enc01.toshiba.co.jp  with ESMTP id 08L7RRRs013295;
        Mon, 21 Sep 2020 16:27:27 +0900
From:   Punit Agrawal <punit1.agrawal@toshiba.co.jp>
To:     Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>, devicetree@vger.kernel.org,
        linux-watchdog@vger.kernel.org, yuji2.ishikawa@toshiba.co.jp,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v3 1/2] watchdog: bindings: Add binding documentation for Toshiba Visconti watchdog device
References: <20200920051807.288034-1-nobuhiro1.iwamatsu@toshiba.co.jp>
        <20200920051807.288034-2-nobuhiro1.iwamatsu@toshiba.co.jp>
Date:   Mon, 21 Sep 2020 16:27:25 +0900
In-Reply-To: <20200920051807.288034-2-nobuhiro1.iwamatsu@toshiba.co.jp>
        (Nobuhiro Iwamatsu's message of "Sun, 20 Sep 2020 14:18:06 +0900")
X-TSB-HOP: ON
Message-ID: <878sd3lhcy.fsf@kokedama.swc.toshiba.co.jp>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.3 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp> writes:

> Add documentation for the binding of Toshiba Visconti SoC's watchdog.
>
> Signed-off-by: Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>
> ---
>  .../watchdog/toshiba,visconti-wdt.yaml        | 49 +++++++++++++++++++
>  1 file changed, 49 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/watchdog/toshiba,visconti-wdt.yaml
>
> diff --git a/Documentation/devicetree/bindings/watchdog/toshiba,visconti-wdt.yaml b/Documentation/devicetree/bindings/watchdog/toshiba,visconti-wdt.yaml
> new file mode 100644
> index 000000000000..721e38fa5a0f
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/watchdog/toshiba,visconti-wdt.yaml
> @@ -0,0 +1,49 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +# Copyright 2020 Toshiba Electronic Devices & Storage Corporation
> +%YAML 1.2
> +---
> +$id: "http://devicetree.org/schemas/watchdog/toshiba,visconti-wdt.yaml#"
> +$schema: "http://devicetree.org/meta-schemas/core.yaml#"
> +
> +title: Toshiba Visconti SoCs PIUWDT Watchdog timer
> +
> +maintainers:
> +  - Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>
> +
> +allOf:
> +  - $ref: watchdog.yaml#
> +
> +properties:
> +  compatible:
> +    enum:
> +      - toshiba,visconti-wdt
> +
> +  reg:
> +    maxItems: 1
> +
> +  clocks:
> +    maxItems: 1
> +
> +required:
> +  - compatible
> +  - reg
> +  - clocks
> +
> +examples:
> +  - |
> +    soc {
> +        #address-cells = <2>;
> +        #size-cells = <2>;
> +
> +        wdt_clk: wdt-clk {
> +            compatible = "fixed-clock";
> +            clock-frequency = <150000000>;
> +            #clock-cells = <0>;
> +        };
> +
> +        watchdog@28330000 {
> +            compatible = "toshiba,visconti-wdt";
> +            reg = <0 0x28330000 0 0x1000>;
> +            clocks = <&wdt_clk>;
> +        };

I was going to suggest adding the "timeout-sec" property as described in
watchdog.yaml but both code and usage seems to suggest it is optional.

> +    };

So,

Reviewed-by: Punit Agrawal <punit1.agrawal@toshiba.co.jp>

Thanks.
