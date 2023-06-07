Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A65C572552C
	for <lists+linux-watchdog@lfdr.de>; Wed,  7 Jun 2023 09:13:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238739AbjFGHNr (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Wed, 7 Jun 2023 03:13:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48442 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235405AbjFGHNr (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Wed, 7 Jun 2023 03:13:47 -0400
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com [IPv6:2a00:1450:4864:20::52f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 782381732
        for <linux-watchdog@vger.kernel.org>; Wed,  7 Jun 2023 00:13:45 -0700 (PDT)
Received: by mail-ed1-x52f.google.com with SMTP id 4fb4d7f45d1cf-51640b9ed95so900020a12.2
        for <linux-watchdog@vger.kernel.org>; Wed, 07 Jun 2023 00:13:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1686122024; x=1688714024;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=XIDN7SGNAgmTaDACmxzYbK4nm0ku0E334Z45z434qxI=;
        b=FUGLpMgfWvUcB5HfVjIvsrysPNGk9zKmJ9TF9Z3IV/N8oy228vAGTedg8SGEdXrcch
         u6gemLT/ulLDVK4h9lrzUUNYDtIWQtXQhvtU4UhKccrIiLu8g/H2MD8NH4LiZ/XES3Bk
         8Coy8mclP13JrefNXfptFQcf6A98G3zrEyDLo6hOYC5A3jE76bxCdA2VKNO60NBJMjga
         dwiaTMHs0V2GHztJ0uiu2b4EVdsV7RhJCsi9QcfeQRm1qSDl+oVWI/LC5iNiOGf6i1iq
         TY0iYp1SQFY3ZMGVZgNOnEdk8Vx+FNMkc3DxN7n+gb6N+UtHlY4fONLTrL27ZZlCeIXa
         xdbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686122024; x=1688714024;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=XIDN7SGNAgmTaDACmxzYbK4nm0ku0E334Z45z434qxI=;
        b=X+iSlnzA1pMP2xKbEcfggxnJMQpafO6qNDgWpkH9wRT7NEQB9afQZ7xueIp0IZl0RD
         DZr25OFBoQfEtdqezkGQ93QKXQI0NOJhWDRD46onqaIEUSFObui9NMvx5Ii/ewM0UG4T
         Qdh4TdTavnFMXwbRIZGOKH5buv2EQmqYmhOdJDCE9ps4gHZk7T5+tPdrJ1sNabNgQGlm
         vU+l39rJ6DktiaNtJ7oAMyDoGkkx6HF7FZv86oSUOiQUs1Fgea9M/LrpR8f63zrVq5VW
         /aeXvomDOj07pdRCcrYsSTW944ycfMiNXNxkWd5T7JsA9QrRtbdddj9nwicTiT5WHF6E
         Ng1w==
X-Gm-Message-State: AC+VfDz4w4Xsqcfg2WsvHDkLPzqbnkX2dIakdWaW7nQc1kLMpVKObxnL
        PpnaCdlHxuPYS5PNuyIbjJHItQ==
X-Google-Smtp-Source: ACHHUZ7ue8QUkbf4LbystMAyp9y0G6QSXOiirtn3D+841TOqHe87HS/FVdskvk+EA6ZSurS/dR3YwQ==
X-Received: by 2002:aa7:ca4e:0:b0:50d:1e11:eb9 with SMTP id j14-20020aa7ca4e000000b0050d1e110eb9mr3704112edt.1.1686122023997;
        Wed, 07 Jun 2023 00:13:43 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.219.26])
        by smtp.gmail.com with ESMTPSA id d5-20020a50fe85000000b00504ecc4fa96sm5922105edt.95.2023.06.07.00.13.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 07 Jun 2023 00:13:43 -0700 (PDT)
Message-ID: <24cc82c7-a4b5-e687-5775-208665d915eb@linaro.org>
Date:   Wed, 7 Jun 2023 09:13:41 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.2
Subject: Re: [PATCH 1/2 v9] dt-bindings: watchdog: marvell GTI system watchdog
 driver
Content-Language: en-US
To:     Bharat Bhushan <bbhushan2@marvell.com>, wim@linux-watchdog.org,
        linux@roeck-us.net, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, linux-watchdog@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        sgoutham@marvell.com
References: <20230605045945.26262-1-bbhushan2@marvell.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230605045945.26262-1-bbhushan2@marvell.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On 05/06/2023 06:59, Bharat Bhushan wrote:
> Add binding documentation for the Marvell GTI system
> watchdog driver.
> 
> Signed-off-by: Bharat Bhushan <bbhushan2@marvell.com>
> ---
> v9:


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

