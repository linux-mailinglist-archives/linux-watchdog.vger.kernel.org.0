Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4B2BA6DD54B
	for <lists+linux-watchdog@lfdr.de>; Tue, 11 Apr 2023 10:24:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230436AbjDKIYf (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Tue, 11 Apr 2023 04:24:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57370 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230215AbjDKIYJ (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Tue, 11 Apr 2023 04:24:09 -0400
Received: from madras.collabora.co.uk (madras.collabora.co.uk [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C97C44EEA;
        Tue, 11 Apr 2023 01:22:52 -0700 (PDT)
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
        (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
         key-exchange X25519 server-signature RSA-PSS (4096 bits))
        (No client certificate requested)
        (Authenticated sender: kholk11)
        by madras.collabora.co.uk (Postfix) with ESMTPSA id EDF8F66031EA;
        Tue, 11 Apr 2023 09:22:49 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
        s=mail; t=1681201371;
        bh=mSraRqNCRsRIu+Sv57cDTx39LddUyhJwzD1kQi9nHco=;
        h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
        b=GSZZEqmnSMny9xXdCIyRSmbJS8CSx7Thye0qxqcKp79J3GjIUaw1AmE4HwNKwcpj9
         OuL8/iZzDLDfbIKA4P7UQ8TBkSChbSZoAkP0Brvj9XOc8LqhBov4F54xdm2z4OE5vc
         3gyHahZ44pmL4RUWxFkTPtQoqUXvinVYlHw1ZzBO6hnRX8bZq/h6ALlikfaVbIUsLZ
         S8VlDba9uk2OrZwkW82y+UwR60eGg0aL+ed+3/KIZ/IE/0Zt9bRUy81NZW7/p8wWzE
         fIQj4ivgwkhnq222B+mp7kh8XMs4+Ucg5+G3s2IwSYZoYR6udhwRnOe/5dG13e9n3l
         IhkXQWTr5bagw==
Message-ID: <5322edfc-2df7-b56b-bb5e-db4c55dff3d0@collabora.com>
Date:   Tue, 11 Apr 2023 10:22:47 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Subject: Re: [PATCH v5 06/12] arm64: dts: mediatek: add mmc support for
 mt8365-evk
Content-Language: en-US
To:     Alexandre Mergnat <amergnat@baylibre.com>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Chaotian Jing <chaotian.jing@mediatek.com>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        Wenbin Mei <wenbin.mei@mediatek.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Zhiyong Tao <zhiyong.tao@mediatek.com>,
        =?UTF-8?Q?Bernhard_Rosenkr=c3=a4nzer?= <bero@baylibre.com>
Cc:     linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, linux-mmc@vger.kernel.org,
        linux-gpio@vger.kernel.org,
        Alexandre Bailon <abailon@baylibre.com>,
        Fabien Parent <fparent@baylibre.com>,
        Amjad Ouled-Ameur <aouledameur@baylibre.com>
References: <20230203-evk-board-support-v5-0-1883c1b405ad@baylibre.com>
 <20230203-evk-board-support-v5-6-1883c1b405ad@baylibre.com>
From:   AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230203-evk-board-support-v5-6-1883c1b405ad@baylibre.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.4 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

Il 07/04/23 14:59, Alexandre Mergnat ha scritto:
> - Add EMMC support on mmc0 (internal memory)
> - Add SD-UHS support on mmc1 (external memory)
> 
> Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>


