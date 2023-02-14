Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1039C695F33
	for <lists+linux-watchdog@lfdr.de>; Tue, 14 Feb 2023 10:29:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231673AbjBNJ3g (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Tue, 14 Feb 2023 04:29:36 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33056 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231791AbjBNJ3c (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Tue, 14 Feb 2023 04:29:32 -0500
Received: from mail-vk1-xa35.google.com (mail-vk1-xa35.google.com [IPv6:2607:f8b0:4864:20::a35])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8937024136
        for <linux-watchdog@vger.kernel.org>; Tue, 14 Feb 2023 01:29:10 -0800 (PST)
Received: by mail-vk1-xa35.google.com with SMTP id j18so2754236vkd.4
        for <linux-watchdog@vger.kernel.org>; Tue, 14 Feb 2023 01:29:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=4RQJbxa2zxf1eok3NXzyUCkQgINd0o868aLrSeXERKc=;
        b=QntRrzqMo+9Pc8HtQ8MxpyBxBAK+Dl8ion1QywDB8e0eh1FsGp+sEbGRkpEgHoYb1S
         8sWqz0TXQVdGWIM+0wW2RQi7F6Ca9eBWixBfR2PqMD20/JRHYaLVKagVYLrZ2CTzOj1f
         d54nTdKQ0WA3a9P9Y6aKyw8kfb1SogA+oPFDZV2Jc5GH4RrTBxRT/1XxSzyDjm3jDcF6
         SNb5fOqxcgFGLeWI3Y4ya64HSULhb9aXSHVG/zcIcu8fdBT/zviwz8VkE/V4cpcRIJWw
         sKGYOU5K6DY/qTwzizj1Xgq04VKIPVkbU8ldKttq2GD2nS6WAMxutuLY3UZ1+MSeZ4/f
         uFRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4RQJbxa2zxf1eok3NXzyUCkQgINd0o868aLrSeXERKc=;
        b=xX7illkl2mzNfLR7TqjwQJOOyjDKv5iSDwZ12/RBRbrA+l+1klpKMiSH/kcK5/1jFI
         DCd6wT7jM8bf9lzcAxOWpHqyWvAXoyLebadopcCc503TNuY+2kB5Nmx+QZTY0vxvXsru
         otuIYVTuG5St4JzAHQjtZ/KxTTLCEefjXdiHy4kApCu5CahpA9Ij8bvSe4BLLQ0QIAHw
         e9a/0+o59iv/pa4qyXYeKG/snep6L5Md6GNoRKoaND+eZa3W40moRztPT+SttwYtD+KA
         oiCwWUMtuZhSO0JMSnIqWYfUYe3ebKgcoOsJ3Qw8oJbEC9kplG6zftb8qv/vSErBdlL0
         jgCg==
X-Gm-Message-State: AO0yUKUxxr1y2cgqUFpWZCaRR20dyQ22VJPzVuvuic6+FArzQ77r4Ixs
        WX6PLDQIvyrJI9KQt8hee5qor3O2X3YIpJzaD8HuKw==
X-Google-Smtp-Source: AK7set+eIcvPal1BBBaXy9jZQLy65xiyv7ukZ+pdg2djtmGh73BkZuMicJiUVcn1KW629aOyxKTN/qycaQuNWppEl7Q=
X-Received: by 2002:a1f:2110:0:b0:3e1:95e8:fe1e with SMTP id
 h16-20020a1f2110000000b003e195e8fe1emr262782vkh.1.1676366948809; Tue, 14 Feb
 2023 01:29:08 -0800 (PST)
MIME-Version: 1.0
References: <20230201152038.203387-1-brgl@bgdev.pl> <20230201152038.203387-6-brgl@bgdev.pl>
In-Reply-To: <20230201152038.203387-6-brgl@bgdev.pl>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Tue, 14 Feb 2023 10:28:58 +0100
Message-ID: <CAMRc=McjsvXi_HZVKJcJ_Y8tF0scfNvhxYF5Hh6HVAUzUkfqBg@mail.gmail.com>
Subject: Re: [PATCH v3 5/5] arm64: dts: qcom: add initial support for qcom sa8775p-ride
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Jassi Brar <jassisinghbrar@gmail.com>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-watchdog@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On Wed, Feb 1, 2023 at 4:21 PM Bartosz Golaszewski <brgl@bgdev.pl> wrote:
>
> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>
> This adds basic support for the Qualcomm sa8775p platform and the
> reference board: sa8775p-ride. The dt files describe the basics of the
> SoC and enable booting to shell.
>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>
> ---
>  arch/arm64/boot/dts/qcom/Makefile         |   1 +
>  arch/arm64/boot/dts/qcom/sa8775p-ride.dts |  47 ++
>  arch/arm64/boot/dts/qcom/sa8775p.dtsi     | 812 ++++++++++++++++++++++
>  3 files changed, 860 insertions(+)
>  create mode 100644 arch/arm64/boot/dts/qcom/sa8775p-ride.dts
>  create mode 100644 arch/arm64/boot/dts/qcom/sa8775p.dtsi
>

Bjorn,

Please DON'T APPLY this one, pick v4 instead. After discussing with
qualcomm, we're removing the watchdog node from dt.

Bart
