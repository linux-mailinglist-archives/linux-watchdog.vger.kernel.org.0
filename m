Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 13171755B4C
	for <lists+linux-watchdog@lfdr.de>; Mon, 17 Jul 2023 08:14:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231383AbjGQGOV (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Mon, 17 Jul 2023 02:14:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52872 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231345AbjGQGOU (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Mon, 17 Jul 2023 02:14:20 -0400
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com [IPv6:2a00:1450:4864:20::531])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5D8FC1B0
        for <linux-watchdog@vger.kernel.org>; Sun, 16 Jul 2023 23:14:19 -0700 (PDT)
Received: by mail-ed1-x531.google.com with SMTP id 4fb4d7f45d1cf-51e99584a82so5416829a12.1
        for <linux-watchdog@vger.kernel.org>; Sun, 16 Jul 2023 23:14:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1689574458; x=1692166458;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=pOzQEdnlypAdJVjzld9kl7sk9oTKJqy9tm/n7ir3cp0=;
        b=PkFsZSgXZmAkYzFJ7aSnST5c4GM8vmJhl3RwCmKjZ0oB611840sNOpa2xjQYM+LlIG
         XSPFKhs1O0kXTgMIGKsSo06mmF4p1KpXIbsS8Yh7gRglytMRnf+a3/IPhMXPKEoEBJum
         5hXJ64NR/3x1/NaXUNjTIWym2NMK9gCZdAYYfNRDhbALwh/Nq2w+UVf/HnibwVQZDcio
         g7L/WsfAmGk0+CK+U+GSGFrM3QmI8OtHxGdv9+7hY8SUnI+K4nBhbx+JTGnkXpgh8J+Z
         DhwPvVDeBx3VlSRCS8lGUHO+dizV/WGQoD+AeY67xqVbnHcKvgoj55pi98HbMZngOpaj
         qtDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689574458; x=1692166458;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=pOzQEdnlypAdJVjzld9kl7sk9oTKJqy9tm/n7ir3cp0=;
        b=DM46QiXDp1UQolu88l9URL2siD4Ze5fjLi2s8niP7/bLJ6zNl2R295Eb9v3TnZ9NLn
         kJabKS8LRaQYkoRUd2mDjlYAyiYvsTqcv6TDGpgvH+ZPdSPL3AeVbcK9mB4+MWnT8brm
         RMRYaH+ln8ylHzTYKUaDBDDZqFOquj5gdrbxDaDpjGDNQrdOiO3vjZnsCHutH25gxOL8
         Md41x5OBaQrq3/HKOwgEmiqG8/NT9HCMElzlQ5sbeipm0OPU4O822gQMG40e6eBk0v6g
         4GeQ0qWWihDjR1KfmYiIK53nAgJfEukR7wXE8TWJ2Br9H75aBnXTJ+YW6PKefXxNpeyL
         x0Ow==
X-Gm-Message-State: ABy/qLalm1sfOfg+1l3CN1h4JDeRnkfm40lO70QHldITzYm8zedyKwfe
        S7wGfSYki2GlZuVQw8ksbFVNCg==
X-Google-Smtp-Source: APBJJlGDsb2lO/LZw3Wu3hJbKoCU558MVOm4n9bYISHYMwDDhz2y2ngehFtJIrO7t4OfBYqdS5Y0Ag==
X-Received: by 2002:a17:906:5c:b0:989:34a0:45b0 with SMTP id 28-20020a170906005c00b0098934a045b0mr12686181ejg.49.1689574457861;
        Sun, 16 Jul 2023 23:14:17 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.223.104])
        by smtp.gmail.com with ESMTPSA id gx17-20020a170906f1d100b00992aea2c55dsm8750684ejb.153.2023.07.16.23.14.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 16 Jul 2023 23:14:17 -0700 (PDT)
Message-ID: <12aeacfe-82c6-9483-e3a3-07ce98c1d6f6@linaro.org>
Date:   Mon, 17 Jul 2023 08:14:15 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v4 3/3] watchdog:rit_wdt: Add support for WDIOF_CARDRESET
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
 <20230717040723.1306374-4-huaqian.li@siemens.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230717040723.1306374-4-huaqian.li@siemens.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On 17/07/2023 06:07, huaqian.li@siemens.com wrote:
> From: Li Hua Qian <huaqian.li@siemens.com>
> 
> This patch adds the WDIOF_CARDRESET support for the platform watchdog
> whose hardware does not support this feature, to know if the board
> reboot is due to a watchdog reset.
> 
> This is done via reserved memory(RAM), which indicates if specific
> info saved, triggering the watchdog reset in last boot.
> 
> Reviewed-by: Guenter Roeck <linux@roeck-us.net>

Really? Where?

Best regards,
Krzysztof

