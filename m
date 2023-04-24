Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 406426DB20D
	for <lists+linux-watchdog@lfdr.de>; Fri,  7 Apr 2023 19:50:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230311AbjDGRut (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Fri, 7 Apr 2023 13:50:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58832 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229557AbjDGRur (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Fri, 7 Apr 2023 13:50:47 -0400
Received: from mail-pl1-x62a.google.com (mail-pl1-x62a.google.com [IPv6:2607:f8b0:4864:20::62a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 71646BB92
        for <linux-watchdog@vger.kernel.org>; Fri,  7 Apr 2023 10:50:43 -0700 (PDT)
Received: by mail-pl1-x62a.google.com with SMTP id d9443c01a7336-1a2bef29f3cso1819575ad.2
        for <linux-watchdog@vger.kernel.org>; Fri, 07 Apr 2023 10:50:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112; t=1680889843;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=eJzkrQgSJLoh68CvGvp1JznAA6lKkLejE1Wur3zdskg=;
        b=XH0UjXnkmfvcZqjTewbnJtcDWSFSJA41wC6V9r5Jriy4njsRmD3H27O3QYYV4AMbUm
         tXDMOylFQmjGVHAvVJDVThyrSJpCbK15BdyXAw/RTy3qqsHIR6h5GbuWp0D0RbsJJMyQ
         tYigUWAUK0wuJZ9Ln/RC6nNHR0Xc5/0j6baPRmmPBKLWI8mS58J1JBnQoFDh2fV6gAVB
         aCWwMbSzJaVd3dqKFSysqW62WCaXVoVFyPNeXhO/N8IkyefOB7epKgE0KjIbL9lO4E2A
         nOD8OiTN+7/mE4Ln7W/1Og55k8VV9viFgsgqrLPhDjnLlEirWNgizYb/4I63kiVYkSRp
         /wmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680889843;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=eJzkrQgSJLoh68CvGvp1JznAA6lKkLejE1Wur3zdskg=;
        b=MnwCwMNwlP010V4bsrpsbospsaqVndqkP+HtMDSm+DDNLfcnu/bk1D8BiDtFySgfTt
         Y3HsiiHcASPB/+6veiVDRGm5mv70vspl8RX6yQFghbr2/NdOYpKo9FbMTkTjfyddb2cB
         PO/ScQBQdmcQ3SJYFulGg6EUvkA6WpUkBG42C6PSkTBfJGFRVh6gfwCL9kX1KOh4WN/u
         5tMIbGTxssOYuGCzyog1ngGClxtC5XH1jnM47DQJ3PCEtDDMNpyzp1zkrAwRlEh+Zuoj
         w9kSfcp47mAIl53skZzU5kLaONJwzh7UgwLx/GAbm0NkQsYPVQir77xs9glShr1zG5iI
         ga0Q==
X-Gm-Message-State: AAQBX9fB+jlMeGR+5vaMTlSx0A0EJVAk+UTgLilJqJaaUTARa6kLIp0I
        XZPcbgVJhZV2movk66dhl+KJIg==
X-Google-Smtp-Source: AKy350aspk9YnMVy5hked+xx58M1c9hroC6snupKIoerfp0YWnXGXrL18Plz3ceLDw7pQ7fY4UQTgQ==
X-Received: by 2002:aa7:9ec4:0:b0:626:7c43:7cb8 with SMTP id r4-20020aa79ec4000000b006267c437cb8mr3003966pfq.20.1680889842767;
        Fri, 07 Apr 2023 10:50:42 -0700 (PDT)
Received: from localhost (63-228-113-140.tukw.qwest.net. [63.228.113.140])
        by smtp.gmail.com with ESMTPSA id e18-20020aa78c52000000b0062a474cd46asm3298198pfd.137.2023.04.07.10.50.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Apr 2023 10:50:42 -0700 (PDT)
From:   Kevin Hilman <khilman@baylibre.com>
To:     Alexandre Mergnat <amergnat@baylibre.com>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
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
        <bero@baylibre.com>
Cc:     linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, linux-mmc@vger.kernel.org,
        linux-gpio@vger.kernel.org,
        Alexandre Bailon <abailon@baylibre.com>,
        Fabien Parent <fparent@baylibre.com>,
        Amjad Ouled-Ameur <aouledameur@baylibre.com>,
        Alexandre Mergnat <amergnat@baylibre.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH v5 00/12] Improve the MT8365 SoC and EVK board support
In-Reply-To: <20230203-evk-board-support-v5-0-1883c1b405ad@baylibre.com>
References: <20230203-evk-board-support-v5-0-1883c1b405ad@baylibre.com>
Date:   Fri, 07 Apr 2023 10:50:41 -0700
Message-ID: <7h355b1szy.fsf@baylibre.com>
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

> This commits are based on the Fabien Parent <fparent@baylibre.com> work.
>
> The purpose of this series is to add the following HWs / IPs support for
> the mt8365-evk board:
> - Watchdog
> - Power Management Integrated Circuit "PMIC" wrapper
> - MT6357 PMIC
> - MultiMediaCard "MMC" & Secure Digital "SD" controller
> - USB controller
> - Ethernet MAC controller
>
> Add CPU Freq & IDLE support for this board.

Tested-by: Kevin Hilman <khilman@baylibre.com>

Thanks for providing the branch with the dependencies.  With that, I
tested basic build & boot on mt8365-evk, and things are working as
expected.

I also enabled `CONFIG_USB_ETH=y` to test with USB ethernet gadget, and
was able use NFSroot, so that's working well also.

Kevin
