Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 131137C5D16
	for <lists+linux-watchdog@lfdr.de>; Wed, 11 Oct 2023 20:54:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232519AbjJKSyt (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Wed, 11 Oct 2023 14:54:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49602 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232997AbjJKSys (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Wed, 11 Oct 2023 14:54:48 -0400
Received: from mail-pg1-x534.google.com (mail-pg1-x534.google.com [IPv6:2607:f8b0:4864:20::534])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EA499A4
        for <linux-watchdog@vger.kernel.org>; Wed, 11 Oct 2023 11:54:45 -0700 (PDT)
Received: by mail-pg1-x534.google.com with SMTP id 41be03b00d2f7-58907163519so108674a12.1
        for <linux-watchdog@vger.kernel.org>; Wed, 11 Oct 2023 11:54:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1697050485; x=1697655285; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1yAITkA43oBRq5wNnpQLBgM5d0bUs6osx3goAerw1Zs=;
        b=rQ5Jrcwch8pt1L2WORz6CKZE7I+oPyNscJf1fRpjvlCE33Q2ktuDovKYdEVV8tDBSt
         VH7QOeQZfduPNGIYbNZPzfMoXTE/VyULkOiUM1xoyEeqr8qSQzoY83VNRrArNfvOR8fw
         TVZVNwrFkOuParsjeM/21+Ho01opcGNBRxJUq1Qt9s91ZnhIBCHvJ5NY5aZ1cNjzWXTY
         FTA1NP9aDnKKMYoDjc/O3B9dPCh3sN39EL9SIm/mf70Kj2vw7OUIWWTneZCiG6jLVkoM
         +btr339vF61praR2UNfAOTFC1DW0sozrMWL5EV46APu9G95r+rQ+37ieozkGwIBq7dUB
         2z+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697050485; x=1697655285;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1yAITkA43oBRq5wNnpQLBgM5d0bUs6osx3goAerw1Zs=;
        b=fg657XXFEmRNP4sETlUoW46KauZwGiVDnYlFZYcGdhQuaPQENksxYLJpwYGk1Xe/7r
         lLQrrBs/x2UvXJ7oFNNsKJ49vksCHl15+AWT8bBsdd0i9Hrh5ceGZUfHiiF4bBIBLW0v
         pTNTUJUi1qWaAsd0D7glBMo3evh5xebHPlTWyf16BAuBKX7nnzw0Nba6PNXXhqgjDM8x
         lqfrw6qRoj3cz7TZOYnEvl8LIrkTr6OMSE6kKEEN+uHlax2R8Rb+S7ymsOyYjuZEI3OG
         TQzAoYEN062B9ScHOu9XhvsCRk7SCdvHmBaRZR7eE5KsiADl10QQQ38vf5BDUijdYkoa
         rcHA==
X-Gm-Message-State: AOJu0YxWR+nrGegIZjnI+TmI5gLoe7QnoYXf3XNXWriNmkbYu6PXR6et
        7yZBJ85XQqKhS349ALOnn+HQ01WC0bZIz33jAmYt1g==
X-Google-Smtp-Source: AGHT+IF2ZH9G5DtfhwrC1grow9snCHgNZ9i9qEm+hDBJbApMW0zlGdoIB5EmMSZ9fCki9SJLAlPeNOp5FVB21fst9pw=
X-Received: by 2002:a17:90b:46c7:b0:277:4b68:b93c with SMTP id
 jx7-20020a17090b46c700b002774b68b93cmr20814772pjb.4.1697050485416; Wed, 11
 Oct 2023 11:54:45 -0700 (PDT)
MIME-Version: 1.0
References: <20231011184823.443959-1-peter.griffin@linaro.org> <20231011184823.443959-2-peter.griffin@linaro.org>
In-Reply-To: <20231011184823.443959-2-peter.griffin@linaro.org>
From:   Sam Protsenko <semen.protsenko@linaro.org>
Date:   Wed, 11 Oct 2023 13:54:34 -0500
Message-ID: <CAPLW+4nipk9sae2UP6Jp_XXtHQMKbNpjGC4F7RW8GTuF3EtRBQ@mail.gmail.com>
Subject: Re: [PATCH v3 01/20] dt-bindings: soc: samsung: exynos-pmu: Add gs101 compatible
To:     Peter Griffin <peter.griffin@linaro.org>
Cc:     robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        mturquette@baylibre.com, conor+dt@kernel.org, sboyd@kernel.org,
        tomasz.figa@gmail.com, s.nawrocki@samsung.com,
        linus.walleij@linaro.org, wim@linux-watchdog.org,
        linux@roeck-us.net, catalin.marinas@arm.com, will@kernel.org,
        arnd@arndb.de, olof@lixom.net, gregkh@linuxfoundation.org,
        cw00.choi@samsung.com, tudor.ambarus@linaro.org,
        andre.draszik@linaro.org, saravanak@google.com,
        willmcvicker@google.com, soc@kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-gpio@vger.kernel.org, linux-watchdog@vger.kernel.org,
        kernel-team@android.com, linux-serial@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On Wed, Oct 11, 2023 at 1:49=E2=80=AFPM Peter Griffin <peter.griffin@linaro=
.org> wrote:
>
> Add gs101-pmu compatible to the bindings documentation.
>
> Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
> ---

Reviewed-by: Sam Protsenko <semen.protsenko@linaro.org>

>  Documentation/devicetree/bindings/soc/samsung/exynos-pmu.yaml | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/Documentation/devicetree/bindings/soc/samsung/exynos-pmu.yam=
l b/Documentation/devicetree/bindings/soc/samsung/exynos-pmu.yaml
> index e1d716df5dfa..9e497c310532 100644
> --- a/Documentation/devicetree/bindings/soc/samsung/exynos-pmu.yaml
> +++ b/Documentation/devicetree/bindings/soc/samsung/exynos-pmu.yaml
> @@ -15,6 +15,7 @@ select:
>      compatible:
>        contains:
>          enum:
> +          - google,gs101-pmu
>            - samsung,exynos3250-pmu
>            - samsung,exynos4210-pmu
>            - samsung,exynos4212-pmu
> @@ -35,6 +36,7 @@ properties:
>      oneOf:
>        - items:
>            - enum:
> +              - google,gs101-pmu
>                - samsung,exynos3250-pmu
>                - samsung,exynos4210-pmu
>                - samsung,exynos4212-pmu
> --
> 2.42.0.655.g421f12c284-goog
>
