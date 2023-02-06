Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 36ED568C841
	for <lists+linux-watchdog@lfdr.de>; Mon,  6 Feb 2023 22:09:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229893AbjBFVJG (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Mon, 6 Feb 2023 16:09:06 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59930 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229705AbjBFVJF (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Mon, 6 Feb 2023 16:09:05 -0500
Received: from mail-vs1-xe35.google.com (mail-vs1-xe35.google.com [IPv6:2607:f8b0:4864:20::e35])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 27DA4222EE
        for <linux-watchdog@vger.kernel.org>; Mon,  6 Feb 2023 13:09:04 -0800 (PST)
Received: by mail-vs1-xe35.google.com with SMTP id d66so14086361vsd.9
        for <linux-watchdog@vger.kernel.org>; Mon, 06 Feb 2023 13:09:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=kKnAJGyCCnfNAGY2q92rHOngYMexjT1r0XxyotjuIu4=;
        b=SCtzaCCTGWvGrvV+OG8Enbzd3Rcm7ItU25n+u/3bOYK1srs4btxAD5m9EDU2vNawNH
         f3iN6qge87wB7C4ZryoFfbaPx91P6ydexW1tHiwLJrQGhRxNUEmjZ657TrHw2m1nEuFf
         PwSpMJFBAIVa8MpOilFOjr8+/JBLulNQSNoExyRt2X56OvD1izB5SiTwmAt9c2Dnh2X8
         jQZUJTJgs3YUPlsrg6zfa9asweL3Ba4FeUBB1p3FmM+qdime8xenpuTf7xN5hv6N+gNX
         E57YGarZMoe5s/kxkGIzjoOgXFt5OOA73bdPNuUt0tiRMJZH0bWXX/N3/Tb4jmL3s+Wz
         yYhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kKnAJGyCCnfNAGY2q92rHOngYMexjT1r0XxyotjuIu4=;
        b=YMi2vCi8hySiyl7x/OiQu9yuFOD5gch7OmrlhCF28GJYn0PbUvqsBlWco/ffGxbaWK
         n5rQ2WtJkWczkwXTNfmSZ0jkcMsvC6y2go3db4XGv+hoWyB4tPz5HnBkAXLi92Kg8fNW
         nVZk2sCXoJX0SYIuKRhqH75FBjrts3aYG5QDZg3Vn7ghMwcY+F/hUqoMSg0vqsxU337v
         hJUG/S+KVUCdNpbqio1vRvzXytZdYiZxsd+3Rr9K2XTJ6H9KaHAKTT/4x7lgQwRtS80B
         j+a/8wxo+9VAFV9knOGCVQZ2YtimwtPRo+I+WIZ81jt7BWmfj0C5rTRJPd3/2ZTbys3C
         MR1w==
X-Gm-Message-State: AO0yUKVDQ/tQNtKANE5KTNtNZLRR81kNHi7S+PhjTt6pmpcG9l5JmFG4
        COuTSMY1AsxJMx4Ij/2iPYlEwqrIxoVnhpbeGA/Mow==
X-Google-Smtp-Source: AK7set96+DXJuZhadEBrgAjWw4rwXNpHt50BHKJiqRWwt7Puds78HllZw1LXnUAOmFcdLvtc4sUdG96/cxPNLG8YluY=
X-Received: by 2002:a67:1904:0:b0:3e8:d5a8:3fbe with SMTP id
 4-20020a671904000000b003e8d5a83fbemr245008vsz.9.1675717743204; Mon, 06 Feb
 2023 13:09:03 -0800 (PST)
MIME-Version: 1.0
References: <20230201152038.203387-1-brgl@bgdev.pl>
In-Reply-To: <20230201152038.203387-1-brgl@bgdev.pl>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Mon, 6 Feb 2023 22:08:52 +0100
Message-ID: <CAMRc=MdEQw=W3CGUepUyPyGF0BEKhhZz8griuRuLW=KEL7ct5Q@mail.gmail.com>
Subject: Re: [PATCH v3 0/5] arm64: qcom: add initial support for qcom sa8775p-ride
To:     Bjorn Andersson <andersson@kernel.org>,
        Andy Gross <agross@kernel.org>,
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
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On Wed, Feb 1, 2023 at 4:21 PM Bartosz Golaszewski <brgl@bgdev.pl> wrote:
>
> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>
> This iteration contains a fixed DTS and all not already applied DT bindings
> patches (with tags collected).
>
> v2 -> v3:
> - reorder properties (reg always first, etc.)
> - tweak node names
> - remove properties filled in by the firmware
>
> v1 -> v2:
> - lots of improvements all around the place to make the dts pass dtbs_check
>   (with some additional patches fixing bugs in existing dt bindings),
>   make dtbs W=1 and checkpatch.pl
> - move board-specific properties to the board .dts file
> - ordered top-level nodes alphabetically and sub-nodes by the reg property
> - fixed licensing
> - set #address-cells and #size-cells to <2> in the soc node and update sub-nodes
>
> Bartosz Golaszewski (5):
>   dt-bindings: firmware: qcom,scm: add qcom,scm-sa8775p compatible
>   dt-bindings: mailbox: qcom-ipcc: document the sa8775p platform
>   dt-bindings: watchdog: qcom-wdt: add qcom,apss-wdt-sa8775p compatible
>   dt-bindings: arm: qcom: add the sa8775p-ride board
>   arm64: dts: qcom: add initial support for qcom sa8775p-ride
>
>  .../devicetree/bindings/arm/qcom.yaml         |   7 +
>  .../bindings/firmware/qcom,scm.yaml           |   1 +
>  .../bindings/mailbox/qcom-ipcc.yaml           |   1 +
>  .../bindings/watchdog/qcom-wdt.yaml           |   1 +
>  arch/arm64/boot/dts/qcom/Makefile             |   1 +
>  arch/arm64/boot/dts/qcom/sa8775p-ride.dts     |  47 +
>  arch/arm64/boot/dts/qcom/sa8775p.dtsi         | 812 ++++++++++++++++++
>  7 files changed, 870 insertions(+)
>  create mode 100644 arch/arm64/boot/dts/qcom/sa8775p-ride.dts
>  create mode 100644 arch/arm64/boot/dts/qcom/sa8775p.dtsi
>
> --
> 2.37.2
>

Hey Bjorn, can you pick up this series as it looks like it's ready to go?

Bart
