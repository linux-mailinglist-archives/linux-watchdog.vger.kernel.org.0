Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6EAB9599BEA
	for <lists+linux-watchdog@lfdr.de>; Fri, 19 Aug 2022 14:26:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1348513AbiHSMXx (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Fri, 19 Aug 2022 08:23:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56610 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1348481AbiHSMXs (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Fri, 19 Aug 2022 08:23:48 -0400
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com [IPv6:2a00:1450:4864:20::130])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 730A9647C8
        for <linux-watchdog@vger.kernel.org>; Fri, 19 Aug 2022 05:23:47 -0700 (PDT)
Received: by mail-lf1-x130.google.com with SMTP id t5so654085lfk.3
        for <linux-watchdog@vger.kernel.org>; Fri, 19 Aug 2022 05:23:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc;
        bh=tt9vafUX/Kn5vikUIbARAwpRfz7CA43/+P3+92uSot0=;
        b=ApWpfItnlRqio9CZwo1CuFAyGsKPkHFVV1c6A/YqKCXugKI7cS4vk1FjDUEE3bzT/L
         6EA5jinRfEP6QplG1pZwdMaHdcVhGJO8H7p2qI1Iecu/eYZaO33/x+WrnQjJfUrJofW+
         q4LS5GUUDUX7i5GDcwpQ+D/Pm+brEu7XJZLyEsUkdy6c64YknzEVuRc5sRvUDoYm2FqA
         Slv54YG9VR1SwpEamtPbd7xSkhzVQX86SIVHlkEOYO7q9enLsH0yyFcH5YUBPs0nYq+J
         zw9cpx78Jo4+vgGzCEMEYkTQuvz/jWd2ZGjPEB3XYC4+0Aenoed4na39IU8sAVUupV1T
         /scw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc;
        bh=tt9vafUX/Kn5vikUIbARAwpRfz7CA43/+P3+92uSot0=;
        b=lErVAFrxrBnw2nFMP5vkAVk05aPBKGHYZQoOccwGk7WgFsBUzyDAsJg/TXwp/KRDLb
         KkeFwr1Tk/nxVM5DNMzWdRxV0I8MuHk9pfUFwzKyNMds1EKV4zrZn11IWXQpxBzRT7yb
         61slX+Fxa4Vq14LTgx3T1MetYKD/Cvxr2JeJxupKD1uQCS46LTrm8YmTyujSB1osgEa6
         NyWaX+Fi12xl6F09PjYOyQ+Dmqsb+xD4v3s/TW3/W6F+kgk/nbCclP8NPkTv83DjD8TV
         QRa7b9D6AqxddqqiNMcQQnfzpEcNOgvmfKskLDq4/Oi5FS0nXUliP4dPmyWT/MPJyFXB
         7bvQ==
X-Gm-Message-State: ACgBeo3H5mwDhcRejfraz7NlcdsSmkwFcb+A7h47RuzRqK+Eah9IQFXF
        9FIK4L+hQ9LITeNmLuzPD/UoEg==
X-Google-Smtp-Source: AA6agR724hPGMuqzxa4iHquLkj8X1MDjSPxyCIi6V06lezxwkIY/NdprGJx4gKyBDS2/D0grhecSQQ==
X-Received: by 2002:a19:490b:0:b0:48a:f60f:aaaa with SMTP id w11-20020a19490b000000b0048af60faaaamr2215074lfa.364.1660911825664;
        Fri, 19 Aug 2022 05:23:45 -0700 (PDT)
Received: from ?IPV6:2001:14bb:ac:e5a8:ef73:73ed:75b3:8ed5? (d1xw6v77xrs23np8r6z-4.rev.dnainternet.fi. [2001:14bb:ac:e5a8:ef73:73ed:75b3:8ed5])
        by smtp.gmail.com with ESMTPSA id e13-20020a05651236cd00b0048b0062a14fsm620530lfs.144.2022.08.19.05.23.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 19 Aug 2022 05:23:45 -0700 (PDT)
Message-ID: <a6b516f2-2b9d-e5cf-7f25-a204ab854b05@linaro.org>
Date:   Fri, 19 Aug 2022 15:23:43 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH V2] dt-bindings: watchdog: Convert Xilinx watchdog
 bindings to json-schema
Content-Language: en-US
To:     Srinivas Neeli <srinivas.neeli@xilinx.com>, linux@roeck-us.net,
        krzysztof.kozlowski+dt@linaro.org, wim@linux-watchdog.org,
        michal.simek@xilinx.com, shubhrajyoti.datta@xilinx.com
Cc:     linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        devicetree@vger.kernel.org, linux-watchdog@vger.kernel.org,
        git@xilinx.com, git@amd.com,
        Radhey Shyam Pandey <radhey.shyam.pandey@xilinx.com>
References: <20220818150637.815-1-srinivas.neeli@xilinx.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220818150637.815-1-srinivas.neeli@xilinx.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On 18/08/2022 18:06, Srinivas Neeli wrote:
> Convert Xilinx watchdog bindings to DT schema format using json-schema
> 
> Signed-off-by: Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>
> Signed-off-by: Radhey Shyam Pandey <radhey.shyam.pandey@xilinx.com>
> Signed-off-by: Srinivas Neeli <srinivas.neeli@xilinx.com>


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


Best regards,
Krzysztof
