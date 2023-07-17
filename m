Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4F15E755B57
	for <lists+linux-watchdog@lfdr.de>; Mon, 17 Jul 2023 08:15:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231401AbjGQGPA (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Mon, 17 Jul 2023 02:15:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53098 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231394AbjGQGOw (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Mon, 17 Jul 2023 02:14:52 -0400
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com [IPv6:2a00:1450:4864:20::532])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0D03610CA
        for <linux-watchdog@vger.kernel.org>; Sun, 16 Jul 2023 23:14:47 -0700 (PDT)
Received: by mail-ed1-x532.google.com with SMTP id 4fb4d7f45d1cf-521650a7603so3693684a12.3
        for <linux-watchdog@vger.kernel.org>; Sun, 16 Jul 2023 23:14:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1689574485; x=1692166485;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=PqU7EIb94jbfT5yq5MO+UONErx/WRoFG1Laz5Y+1ue4=;
        b=AsDspnsuggi7m5kcJbDdcpC84ys4ejm8+K2KaIaH+DP2ewRaobVx+V9DPPZC2CfqTA
         S0bJqE/hu86Jk/Z7jHpmFHBy944cltXMftIaup/dGHm5ivIhJmvTTbcfDGSXMDYW0w4J
         N3mezBgOk7dnsjHPV7Z5GvQvpG1Sycli0oQKtC3+9M6iBiWoeBdW0cytGZvdv5NUvF2w
         dxg/Sv4iTY8SrYsjN0SjtCpjLDi6XQOBLovsEJugovYuOWY6PiTd65gEGmjPmnXZdSTt
         BtPdKTlJSxYhRPS0MMMO4PrLBUEZlztui32HsZxpvMXqB6MQnY8A/0eGTcw1Zcpi1OYy
         qj9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689574485; x=1692166485;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=PqU7EIb94jbfT5yq5MO+UONErx/WRoFG1Laz5Y+1ue4=;
        b=Dw5EVgi2C/1yxhzgnqpPGFcS2COTNaZkLYurZobvico7Znbk2dshIsP92quFhLy3Da
         rsNHlHlK8mdXK1m4AL/EDITMzfRImYnlBEq0qdJeZ+S8xynAa1XqVrhHKf5jlLsQgzgO
         IBUXgZ9Lo82/BEpxlH8oFmItg353UnrhV1tmksky93ZU3m018kZzCIUZdU0jYoEwVMkB
         RbKDrzKtBC6STNNAmki+q2QnMll4CZVvAsXTUE3bQDKYlmiQWUpjuBsfTNJ4B/l/ekv7
         KaJjVvqND41nGPB4qdgYsk1TOuABBnFY8lVoI/df9uCt7gOmxS5cYGFQjSOIpnzg2znJ
         BY3w==
X-Gm-Message-State: ABy/qLYJSUK34cR/c+YHlayaXgZEt1L5mZC4IkA2+ki7RbpEvQl10KDW
        W8MKstOQGZz2hD2c9NtV04q67Q==
X-Google-Smtp-Source: APBJJlEoz69qwT8njwVjJhsppXie7yLjK6vV1vIxNlPMKy3i4lA8W6yz1GqKco1eU7+E2EUnmzLHbg==
X-Received: by 2002:a05:6402:8d0:b0:51e:1c18:dd99 with SMTP id d16-20020a05640208d000b0051e1c18dd99mr9564052edz.38.1689574485701;
        Sun, 16 Jul 2023 23:14:45 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.223.104])
        by smtp.gmail.com with ESMTPSA id s7-20020aa7d787000000b005217a24addbsm2886716edq.20.2023.07.16.23.14.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 16 Jul 2023 23:14:45 -0700 (PDT)
Message-ID: <8a188a4e-cfa3-01f5-fd3f-d945f14e943a@linaro.org>
Date:   Mon, 17 Jul 2023 08:14:43 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [DONOTMERGE PATCH v4 2/3] arm64: dts: ti: Add reserved memory for
 watchdog
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
 <20230717040723.1306374-3-huaqian.li@siemens.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230717040723.1306374-3-huaqian.li@siemens.com>
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
> This patch adds a reserved memory for the TI AM65X platform watchdog to
> reserve the specific info, triggering the watchdog reset in last boot,
> to know if the board reboot is due to a watchdog reset.
> 
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

You are joking from us and our process, right?

NAK.

Best regards,
Krzysztof

