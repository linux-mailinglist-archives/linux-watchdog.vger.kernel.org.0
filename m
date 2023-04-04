Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1F7AC6D6E16
	for <lists+linux-watchdog@lfdr.de>; Tue,  4 Apr 2023 22:31:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236122AbjDDUbj (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Tue, 4 Apr 2023 16:31:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44502 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229731AbjDDUbh (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Tue, 4 Apr 2023 16:31:37 -0400
Received: from mail-pl1-x633.google.com (mail-pl1-x633.google.com [IPv6:2607:f8b0:4864:20::633])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BC54344BF
        for <linux-watchdog@vger.kernel.org>; Tue,  4 Apr 2023 13:31:35 -0700 (PDT)
Received: by mail-pl1-x633.google.com with SMTP id w4so32438217plg.9
        for <linux-watchdog@vger.kernel.org>; Tue, 04 Apr 2023 13:31:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112; t=1680640295;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=EOVeDn8sGMiyUFHnj/niym7+yJLePku8ZuvCvpjBjFA=;
        b=d2PfSMqYfgsZroD2KnzQMRj0RMGsWfZOj8Pbma82DQC/fdoAL7fp4u3QRYiYy0KsxD
         7J2e/+s31Z1QQnI/qyqshLlDgu+gpXILHPK0Jdtbp3wfz5cn4ytd1IDNsyWG6Zs1qD9b
         WATap2+gj3/N62oIZ6s5sB34NSYCjItBlYteXFqgR861/Fh/7zmJzj7RjnwFpMvGYD+s
         TwK/P/yR8kLl7NVvE9VrRC860srGxgFh4X0TVV1Q2pUt3Ikfyq1u1wpY/jIXj2TyS7JN
         gNzlm+DEd4jK9eCkoSfSMTV0tHcgHYjdqxZik2z7GkUwOBDBEZeyDropDBoOwbivkXiD
         tIIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680640295;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=EOVeDn8sGMiyUFHnj/niym7+yJLePku8ZuvCvpjBjFA=;
        b=yAUq/N6twf19G7JvAg035qo701cN8hE0ngvY/yOyGdt6yzGz+86jaf9Ct6lZmtkr0j
         FQDkayr4ziOvh7flSHho24i7CwR+1/CwJg+jFyx5akJGeTvIJtLrLtU3sIwU5E+Sn/Zp
         XQfJh1bNz50ANGsS3x+5JrUti4c+Ehg8ClJfBdVWTIkNWvrsg3nO4dVr3YT8kAM7OBIj
         A0bmAstY9TvqKEr80JBEf/dzqnxLzDhH9HbvLVGWJd8TcMrWz74tSFDVTf0h4622xtkO
         q/n29FGgjnSh7wgEoPe0hRHi+L4M01PkD/NIFvCfaB69f71h8VYVJYC93zM4kTz3OK6C
         d3Vw==
X-Gm-Message-State: AAQBX9dZ6mATeT6niDRfObvMviHJgMNXEp1q6roJrHsjqKU9rEeZqgog
        4hVral9NzwWeN3/P42HIGe3dOg==
X-Google-Smtp-Source: AKy350YCpPag6hyvNnZwcBiqsXWIy1NnNsjRyvNEOMoKbr9kgeRuFVAQ98Nq/oUQ25+hXB9CQPoU3Q==
X-Received: by 2002:a17:90b:3ece:b0:22c:6d7c:c521 with SMTP id rm14-20020a17090b3ece00b0022c6d7cc521mr4045682pjb.45.1680640294866;
        Tue, 04 Apr 2023 13:31:34 -0700 (PDT)
Received: from localhost (63-228-113-140.tukw.qwest.net. [63.228.113.140])
        by smtp.gmail.com with ESMTPSA id jm21-20020a17090304d500b001a1fe42a141sm8706184plb.115.2023.04.04.13.31.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Apr 2023 13:31:34 -0700 (PDT)
From:   Kevin Hilman <khilman@baylibre.com>
To:     Alexandre Mergnat <amergnat@baylibre.com>
Cc:     Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>,
        Chaotian Jing <chaotian.jing@mediatek.com>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        Wenbin Mei <wenbin.mei@mediatek.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Zhiyong Tao <zhiyong.tao@mediatek.com>,
        Bernhard =?utf-8?Q?Rosenkr=C3=A4n?= =?utf-8?Q?zer?= 
        <bero@baylibre.com>, linux-watchdog@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, linux-mmc@vger.kernel.org,
        linux-gpio@vger.kernel.org,
        Alexandre Bailon <abailon@baylibre.com>,
        Fabien Parent <fparent@baylibre.com>,
        Amjad Ouled-Ameur <aouledameur@baylibre.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH v4 00/11] Improve the MT8365 SoC and EVK board support
In-Reply-To: <CAFGrd9qLzcDJO_Fk_-B6XYuuxQzQoYLXmdp0Qj1Tszr0-sqNgw@mail.gmail.com>
References: <20230203-evk-board-support-v4-0-5cffe66a38c0@baylibre.com>
 <7hy1ncydtc.fsf@baylibre.com>
 <CAFGrd9rKy9a4bUf1dkUtTogtWPFr5eu3jcsdaixi3hs_dWMwrg@mail.gmail.com>
 <CAFGrd9qLzcDJO_Fk_-B6XYuuxQzQoYLXmdp0Qj1Tszr0-sqNgw@mail.gmail.com>
Date:   Tue, 04 Apr 2023 13:31:33 -0700
Message-ID: <7hr0szwfru.fsf@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

Alexandre Mergnat <amergnat@baylibre.com> writes:

> Here a build-able & working branch with dependencies:
> https://gitlab.baylibre.com/baylibre/mediatek/bsp/linux/-/commits/amergnat/i350-evk-board-support

Thanks for a branch with all the dependencies.

This branch builds & boots, but crashes because in the upstream default
defconfig, the CPUfreq driver is built-in and the regulator that it
depends on is not enabled.

Changing CPUfreq to be modular with CONFIG_ARM_MEDIATEK_CPUFREQ=m
allowed me to boot to a shell on mt8365-evk.

This suggests that this series needs some defconfig patches to enable
the new features, preferably as modules.

It's probably OK that the defconfig patch(es) come as a separate series,
but not sure what Matthias' preferences are here.

Kevin

