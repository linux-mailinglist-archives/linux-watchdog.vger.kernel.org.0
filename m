Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E6070557557
	for <lists+linux-watchdog@lfdr.de>; Thu, 23 Jun 2022 10:25:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230043AbiFWIZC (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Thu, 23 Jun 2022 04:25:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38974 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229812AbiFWIZA (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Thu, 23 Jun 2022 04:25:00 -0400
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com [IPv6:2a00:1450:4864:20::52f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 182EF48897
        for <linux-watchdog@vger.kernel.org>; Thu, 23 Jun 2022 01:24:59 -0700 (PDT)
Received: by mail-ed1-x52f.google.com with SMTP id z11so21240880edp.9
        for <linux-watchdog@vger.kernel.org>; Thu, 23 Jun 2022 01:24:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=iPEJUCFh/LGfN07qgp4D4vZfakFgeL5DubV5qPb1vuI=;
        b=ZJXFZdn7LZ9vkXjzhqyS3/NebCycR1haecnHXNenUjrPneysJnD2YR/e9ZNLQDz064
         ZnxEEXAeZzrxNmorE3GexHjrNHKd9Tel9VJ9xG87QnWe2DUzCIYWynWtnqzrKHMou0rr
         oagI4DHcQuOK6XwhGa/8OG+s7b/D4PjProGstowCpjJuk20v7jeB/6KuwNmlSwfnY9Hr
         CPECaGtaHN2p1/SDIVf6UBSAWbEHg5FY0cQ/wNnD3FTOzFETGOGyTaVhHXV8QVLjlfmN
         SnMFTlfDJiCrLGUwLjn9Ue3OtwmUntqyz5qQvDGBVoIKDcdCiMqq7pD2apAFsuhCrgOR
         vWhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=iPEJUCFh/LGfN07qgp4D4vZfakFgeL5DubV5qPb1vuI=;
        b=Pan615+00wM0uzHLOWhdgFgTmUx/8k+tSllee+6k5UxkZSmXmP3AUhTMAocdcCcc2z
         kwOus1miGffbgvvOcuqxgcepUzsTE48Cspz18nj0k2BcFL2kGgelHfrQTXufUg7OWqjG
         bjGVn/Rta3LPgp+8W8wOTGr5YYakZL3PL3dBG9V8Vt5r5XvI7KXsi+SmNBnSVTM03DCz
         wCfmLnHv8vm/oyHWyP4XLIc2cpYyggt9qTdBkLzPvNLA1bFHp+yChh4TKkIBFJkzDdFH
         ySbKJX/Ips3bT9PKLm+NpHO1jp7N3sIylIIqRP3w8rv93unXhpO9SkIDqtEQho662uSC
         LjPg==
X-Gm-Message-State: AJIora9vP2qn+bbC43Oy9y2Jh6RkeVRhD1CocMOSEIQdZYdIPYab1E+M
        cj8XrUrPhh3VoW4y8LHSOnLNqQ==
X-Google-Smtp-Source: AGRyM1uqdYHMnG6oMpB23aTJs+RrOabEGX9oUQaYpbmrnI/Ldu2XXFpkv22oD3TSMa+JwG0S4Zlf1w==
X-Received: by 2002:a05:6402:1e95:b0:42a:c466:52ad with SMTP id f21-20020a0564021e9500b0042ac46652admr9170876edf.340.1655972697653;
        Thu, 23 Jun 2022 01:24:57 -0700 (PDT)
Received: from [192.168.0.226] (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id e19-20020a170906315300b00704cf66d415sm10599581eje.13.2022.06.23.01.24.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 23 Jun 2022 01:24:57 -0700 (PDT)
Message-ID: <cb4ee252-e1dc-1e23-79e4-ae06fb126692@linaro.org>
Date:   Thu, 23 Jun 2022 10:24:55 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH v5 05/18] dt-binding: clk: npcm845: Add binding for
 Nuvoton NPCM8XX Clock
Content-Language: en-US
To:     Tomer Maimon <tmaimon77@gmail.com>, avifishman70@gmail.com,
        tali.perry1@gmail.com, joel@jms.id.au, venture@google.com,
        yuenn@google.com, benjaminfair@google.com, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, mturquette@baylibre.com,
        sboyd@kernel.org, p.zabel@pengutronix.de,
        gregkh@linuxfoundation.org, daniel.lezcano@linaro.org,
        tglx@linutronix.de, wim@linux-watchdog.org, linux@roeck-us.net,
        catalin.marinas@arm.com, will@kernel.org, arnd@arndb.de,
        olof@lixom.net, jirislaby@kernel.org, shawnguo@kernel.org,
        bjorn.andersson@linaro.org, geert+renesas@glider.be,
        marcel.ziswiler@toradex.com, vkoul@kernel.org,
        biju.das.jz@bp.renesas.com, nobuhiro1.iwamatsu@toshiba.co.jp,
        robert.hancock@calian.com, j.neuschaefer@gmx.net, lkundrak@v3.sk
Cc:     devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-serial@vger.kernel.org,
        linux-watchdog@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
References: <20220622132302.267010-1-tmaimon77@gmail.com>
 <20220622132302.267010-6-tmaimon77@gmail.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220622132302.267010-6-tmaimon77@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On 22/06/2022 15:22, Tomer Maimon wrote:
> Add binding for the Arbel BMC NPCM8XX Clock controller.
> 
> Signed-off-by: Tomer Maimon <tmaimon77@gmail.com>


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


Best regards,
Krzysztof
