Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 529DE53F639
	for <lists+linux-watchdog@lfdr.de>; Tue,  7 Jun 2022 08:34:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237057AbiFGGej (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Tue, 7 Jun 2022 02:34:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53550 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237050AbiFGGeh (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Tue, 7 Jun 2022 02:34:37 -0400
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com [IPv6:2a00:1450:4864:20::62b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 826D730F6F
        for <linux-watchdog@vger.kernel.org>; Mon,  6 Jun 2022 23:34:34 -0700 (PDT)
Received: by mail-ej1-x62b.google.com with SMTP id u12so33140678eja.8
        for <linux-watchdog@vger.kernel.org>; Mon, 06 Jun 2022 23:34:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=BS02hl5lG0fU1teehsFBTzwy9idYtqKSriIvuXGDAVw=;
        b=a7CXUgo1LhI6a6Wn7l3MjaqsS2nWFcnVUfB+fpGL3Su3s8vvd+hexirjTkuKfqfJku
         tpNMIqWEqQEc2ykTutSqnsatSkZguMPoVRX3zgp44CcWRwEfmM1O1H6YW+PdMuDF7l1h
         GQ6t7rKl0oPrV2wyje3dJJlB8t/G+d+oEPBjgNvSx5jNjOGBUUFO1INCvt51Z5vD9upr
         zpEb/NvfB8O/xEMwCpBTttttkHN5KejGkpvAyS3ebegD2zJBG1dA9Qz1ci0llYeESeo+
         JMbAguBqPVrXMBWFpgVz6EOSHE3P+6K+R88uzWCgJV4Flf2vyjRbzalZP0Jxm4TrIWS4
         iuAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=BS02hl5lG0fU1teehsFBTzwy9idYtqKSriIvuXGDAVw=;
        b=ov/FrcDDWiP3rLhrPHKIHDbFR9EHnPsJsf4BtcfiF2HgEXGXNMvDwjp/4iTS+DbVg8
         z8HuYPSFInETTxeqLqNg/BDLqTTD0Rxp10Aj5dKIKUIgMFoOcgS+isXES5FHJh9eiQLv
         DZmyOurzYf19gTnbn60i3dybieJyGwW3lJmIcDk7N33AsU9V/hqX6wC0Sn1g89gHONAF
         gVcKFeVk8WGCz174+/GEtYm/hpI9smVszsr/wMB+A3KuHrQK6x80jZh6GEjssMPfVxs4
         r2PuqE/dQEmy5tc64svovpaOOrE9+42KlE4veWZ4nMOhgYwp+huiXTrWl7nzpCVHanyy
         gtvA==
X-Gm-Message-State: AOAM5327RE1wJ/DlsEKJ6zXCNRe1AHGEOXr/Ejwwm6gawRTELwXY0iU8
        LZfmUI9BpBm4FN+Xk/avNHmnBg==
X-Google-Smtp-Source: ABdhPJxeChl1qKeEil8PnLVpGZrlHOFtfAIS6W5eozpO3H9ZCDC+R/hedgSwKsMBni0ziaZVCtATcQ==
X-Received: by 2002:a17:907:7e8b:b0:711:e5e6:6694 with SMTP id qb11-20020a1709077e8b00b00711e5e66694mr150753ejc.35.1654583673038;
        Mon, 06 Jun 2022 23:34:33 -0700 (PDT)
Received: from [192.168.0.181] (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id me3-20020a170906aec300b006ff01fbb7ccsm7153425ejb.40.2022.06.06.23.34.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Jun 2022 23:34:32 -0700 (PDT)
Message-ID: <717eb4d5-f547-4763-1670-51e90cbe0803@linaro.org>
Date:   Tue, 7 Jun 2022 08:34:31 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH] dt-bindings: Drop more redundant 'maxItems/minItems' in
 if/then schemas
Content-Language: en-US
To:     Rob Herring <robh@kernel.org>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Hu Ziji <huziji@marvell.com>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Chen-Yu Tsai <wens@csie.org>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Samuel Holland <samuel@sholland.org>,
        Maxime Ripard <mripard@kernel.org>
Cc:     linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-tegra@vger.kernel.org, linux-mmc@vger.kernel.org,
        linux-watchdog@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev
References: <20220606225137.1536010-1-robh@kernel.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220606225137.1536010-1-robh@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-5.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On 07/06/2022 00:51, Rob Herring wrote:
> Another round from new cases in 5.19-rc of removing redundant
> minItems/maxItems when 'items' list is specified. This time it is in
> if/then schemas as the meta-schema was failing to check this case.
> 
> If a property has an 'items' list, then a 'minItems' or 'maxItems' with the
> same size as the list is redundant and can be dropped. Note that is DT
> schema specific behavior and not standard json-schema behavior. The tooling
> will fixup the final schema adding any unspecified minItems/maxItems.
> 
> Signed-off-by: Rob Herring <robh@kernel.org>


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


Best regards,
Krzysztof
