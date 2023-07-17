Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BA51B755B5E
	for <lists+linux-watchdog@lfdr.de>; Mon, 17 Jul 2023 08:16:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231437AbjGQGQj (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Mon, 17 Jul 2023 02:16:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54542 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231383AbjGQGQi (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Mon, 17 Jul 2023 02:16:38 -0400
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com [IPv6:2a00:1450:4864:20::629])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 610A11A4
        for <linux-watchdog@vger.kernel.org>; Sun, 16 Jul 2023 23:16:37 -0700 (PDT)
Received: by mail-ej1-x629.google.com with SMTP id a640c23a62f3a-991ef0b464cso1123865666b.0
        for <linux-watchdog@vger.kernel.org>; Sun, 16 Jul 2023 23:16:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1689574596; x=1692166596;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=2entuFfzv06LWf7ZDQbfS5AMpEjfwXM5BlDm2xKGsjc=;
        b=Mw4RODoz4BE+XD5UXyudGlD1SjvpGTrtDS8Nlbz+8NMBgF1UAU+2YZMkj1sMSOHEV3
         GKMh0FA7PCBGky8bkHzM5/mR55EH3QCQ5ONqhxJOMhxt2/suCeuPdEnWeJeYyGLD7qvK
         ZduxDYWE8Z19fVC0qOlAIrsK2xE0OpGTX8DGKkfIP/ItdOn4u3+KbSlf87J3yA9r6+2B
         GE8mcWp+yb/tzcp3cbeD7uqszVS+SvOIKDzf4hmhLisnDWzUzcIK5qr84QRrGofJkUgb
         sih9Gfhuus0H0+/OdLiN2EQG/DR/0nsvyDk2iIB11GcGtWi9s3Pto1Qjth+4WK5x7fiR
         U90Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689574596; x=1692166596;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2entuFfzv06LWf7ZDQbfS5AMpEjfwXM5BlDm2xKGsjc=;
        b=iC+TQPIdnDcy3wF7jeftmhZOVzIBvoDBonPc7nTm6cR6XJttU/szfot9cOTwB06/en
         6EJepqAxGp4qthC6uc4xAWh3Aph3mxuqkFrrd6bkx4jmrLq0/Kr2uW4m1JyJ1tE2Irfe
         zrntmrMJXY/y4/mIlwQ+UN6jB46pKHz3luZj1oQiG3wzReXVcZqk3CctqRl/So9gbC7+
         t8ln9Ywbgpn4bkHlO2Dz/NzYfXbX/s5QYSTrT1kmNgg+4rZZHyWuLVwZ3X61gTrfesqD
         0QNUSrj/oebLhxbeqj9d4NBzL5S3Ne1DEjc7OO/Dt7l5u7qjrKivrBvj+OWNPYFiWDxE
         bwGw==
X-Gm-Message-State: ABy/qLYQTb97bKiyCuz3vvUn8HuVGGn0om1UaADPcr3BnAEBGVQ255gT
        +xQwNMCMgvQaYvpm/3dVsxZxAA==
X-Google-Smtp-Source: APBJJlFSRSJ3eceIL2mLhLg4cLl56txNob5VQD1I3l8rZT/MOUjVg+APcNTJdIk8JLaOzJPhmg4Gwg==
X-Received: by 2002:a17:906:68c9:b0:989:450:e565 with SMTP id y9-20020a17090668c900b009890450e565mr9927308ejr.23.1689574595927;
        Sun, 16 Jul 2023 23:16:35 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.223.104])
        by smtp.gmail.com with ESMTPSA id qt11-20020a170906eceb00b00997c1d125fasm1416803ejb.170.2023.07.16.23.16.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 16 Jul 2023 23:16:35 -0700 (PDT)
Message-ID: <f5ff9616-c71c-f71e-ce4a-7b9fa7055bb4@linaro.org>
Date:   Mon, 17 Jul 2023 08:16:33 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v4 0/3] Add support for WDIOF_CARDRESET on TI AM65x
Content-Language: en-US
To:     huaqian.li@siemens.com, wim@linux-watchdog.org, linux@roeck-us.net,
        robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        conor+dt@kernel.org
Cc:     huaqianlee@gmail.com, nm@ti.com, vigneshr@ti.com,
        kristo@kernel.org, linux-watchdog@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, jan.kiszka@siemens.com,
        baocheng.su@siemens.com
References: <20230717040723.1306374-1-huaqian.li@siemens.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230717040723.1306374-1-huaqian.li@siemens.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On 17/07/2023 06:07, huaqian.li@siemens.com wrote:
> From: Li Hua Qian <huaqian.li@siemens.com>
> 
> The watchdog hardware of TI AM65X platform does not support
> WDIOF_CARDRESET feature, add a reserved memory to save the watchdog
> reset cause, to know if the board reboot is due to a watchdog reset.
> 
> Signed-off-by: Li Hua Qian <huaqian.li@siemens.com>
> ---
> Changes in v4:
> - Fix the coding style.
> - Add usage note for the reserved memory.
> - Link to v3:
>   https://lore.kernel.org/linux-watchdog/20230713095127.1230109-1-huaqian.li@siemens.com

Much more changed. You added example in the bindings which no one asked
for. Then you added multiple fake review tags to all the patches.

Best regards,
Krzysztof

