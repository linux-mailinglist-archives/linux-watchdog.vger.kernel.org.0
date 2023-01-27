Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 026A567E68C
	for <lists+linux-watchdog@lfdr.de>; Fri, 27 Jan 2023 14:25:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231863AbjA0NZH (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Fri, 27 Jan 2023 08:25:07 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42490 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231643AbjA0NZG (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Fri, 27 Jan 2023 08:25:06 -0500
Received: from mail-yb1-xb2c.google.com (mail-yb1-xb2c.google.com [IPv6:2607:f8b0:4864:20::b2c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1D1EE7CCB6
        for <linux-watchdog@vger.kernel.org>; Fri, 27 Jan 2023 05:25:04 -0800 (PST)
Received: by mail-yb1-xb2c.google.com with SMTP id e15so5923731ybn.10
        for <linux-watchdog@vger.kernel.org>; Fri, 27 Jan 2023 05:25:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=YfmZdMJN/D3xI4YTB54xIsWSAze0zkG8RrFJPkBL4AQ=;
        b=d2yyXte/yKIliOx/+8dSFRH8+M3Ex72UVdCuqh3m2tyi3rrRYlzuFLuFuOaXo8UJua
         gElqKdzCZZxnNL7BluA63zU1vXbJTTdCGK01yYehPr6WfmZLwmosoPiS95G7b5lmagCS
         L/upqPf5qIY2pjLEDKrUW9EdvBvPWpcC2GegAPRzTI8cGzevNc5TRFXyVw8hHFy7XJzN
         TH3bv0sOG57U6+65n9Xq6fsYWtTWYlZhS/Bzf440xEraF0lC2iKIkZMz3ndkI1DvtaHw
         EQNdQGri5E5aTQGN016ehd0p8PTqoPCqtOXzj5K3ayVZ69ryCa5toREYxDUTePUi+iWo
         LVcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YfmZdMJN/D3xI4YTB54xIsWSAze0zkG8RrFJPkBL4AQ=;
        b=RhliZ0i1kWKYX4lrvrTfsAJ/aJ5xIeLdnTtHoUkSZ5IRYbpbKHC1kDk8s604u+dblw
         oSWS7mMGch2a6MLsRO4p7f2mbFkaJLvJSiFETLzRsLCvRtT0ymMHFtUYY0QAZSxpWXgR
         LMip79xkJsO71HqeR9g1acPFfL+QHXfigSuDMwHT/T8KfK5CZKSgUQN8xNfyMVzxSZII
         d/cw6KRp1fIlTZijYbkDQ+DAJ/IvfGrwF8YmvxIj5B72q2Iyrv+7Of5LVcyCdN1pdG6G
         JF1DpwwtaKU29Xkwkh5yFi14sO6lSrYoBdlf+/YYbwA+P7kjEkzY9cxjtQ36OaG/tivg
         S+7g==
X-Gm-Message-State: AO0yUKUIJZ5MrAm+KXmLC18iSQ/USCaImUu5NDtjZqUj6i3LIv6fonZ/
        EYJohCtE7rTW2UGorQkUAZyWqOassZP2p2cYukWZWA==
X-Google-Smtp-Source: AK7set/AyCr5YILgHa1njAbv5GENd6K1HRNPT5FGDcIp6NDqNoyOABScAptxZu4MVa9CTfeWH7nQwPnr2nr1FbGyMhU=
X-Received: by 2002:a25:d1d1:0:b0:80b:4d84:b25 with SMTP id
 i200-20020a25d1d1000000b0080b4d840b25mr1325238ybg.584.1674825903381; Fri, 27
 Jan 2023 05:25:03 -0800 (PST)
MIME-Version: 1.0
References: <20230127093217.60818-1-krzysztof.kozlowski@linaro.org> <20230127093217.60818-3-krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230127093217.60818-3-krzysztof.kozlowski@linaro.org>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Fri, 27 Jan 2023 14:24:52 +0100
Message-ID: <CACRpkdZUD1rw5j=Kik9KMt0w=JzS_T06FOGnyUA9GWmWZyQjcA@mail.gmail.com>
Subject: Re: [PATCH v2 2/3] dt-bindings: reference MC peripheral properties in
 relevant devices
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc:     Damien Le Moal <damien.lemoal@opensource.wdc.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Linus Walleij <linusw@kernel.org>,
        Imre Kaloz <kaloz@openwrt.org>,
        Krzysztof Halasa <khalasa@piap.pl>,
        Miquel Raynal <miquel.raynal@bootlin.com>,
        Richard Weinberger <richard@nod.at>,
        Vignesh Raghavendra <vigneshr@ti.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Marek Vasut <marex@denx.de>, Lubomir Rintel <lkundrak@v3.sk>,
        - <devicetree@vger.kernel.org>, Marc Zyngier <maz@kernel.org>,
        linux-ide@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-mtd@lists.infradead.org, linux-serial@vger.kernel.org,
        linux-watchdog@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On Fri, Jan 27, 2023 at 10:32 AM Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:

> Several devices can be attached to memory controllers (or memory-mapped
> buses), thus they can come with additional controller-specific
> properties, e.g. devices wired under Intel IXP4XX bus: cfi-flash,
> intel,ixp4xx-compact-flash, NS8250 serial and MAX6369 watchdog.
>
> Referencing Memory Controller or IXP4XX bus peripheral properties fixes
> few dtbs_check warnings like:
>
>   intel-ixp42x-gateworks-gw2348.dtb: ide@1,0: Unevaluated properties are not allowed
>     ('intel,ixp4xx-eb-ahb-split-transfers', 'intel,ixp4xx-eb-byte-access', ... ' were unexpected)
>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Acked-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
