Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 85B663DB08C
	for <lists+linux-watchdog@lfdr.de>; Fri, 30 Jul 2021 03:14:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229667AbhG3BOd (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Thu, 29 Jul 2021 21:14:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46450 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232487AbhG3BOd (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Thu, 29 Jul 2021 21:14:33 -0400
Received: from mail-ot1-x32a.google.com (mail-ot1-x32a.google.com [IPv6:2607:f8b0:4864:20::32a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 66460C061765;
        Thu, 29 Jul 2021 18:14:29 -0700 (PDT)
Received: by mail-ot1-x32a.google.com with SMTP id 61-20020a9d0d430000b02903eabfc221a9so7855558oti.0;
        Thu, 29 Jul 2021 18:14:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=PwzNvjTXIRZgn/UCAoG6LastN6448esuCf66H5wLEFs=;
        b=WP1RDPXeaIkvSiRYFgixic53nzvAYYlFzXQhkAwA75nwMiQYl+3LebW9vLdVUFM0+Y
         p22tw3sSwAzuxsKL+GmSCdnDiXbnX5etMhfnfwFiORL7QFUDTRYv0dd2I5saCK/wtd3G
         WK14wnGl/OPavbBGAUDsXU7J6lWp4jZijpqsRmMCoW9K3rhLlelw51cvHsOz1J+n0/M6
         msZ20c4U3475JnzJ2AnH3DKYBFfkFJJitgEKLrsuye5rN5+Nba2S5UTpnWqaH1C6KrMF
         +DsenrpBcQa3InWI9M3C5yIlOLzCvvyMOS4bVWiHkXPP9537Ec0apy4u84yqD7DVmRqw
         Cswg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=PwzNvjTXIRZgn/UCAoG6LastN6448esuCf66H5wLEFs=;
        b=S7oAByzcIqSnWTBPrlBglXnatzWA6CJ+IN2IML75TnSDumt9I7e9d2FsiXlAEmMQwr
         NFSqv8taZ7sSVlTNDwaGLVsyvIQ2RxOAG3MohpNE4ofWOAaIuCKNn2jf/tTFsFHPKiOx
         kIdu2ixCs8GtftLG9qCRf8dgD0cFLZ83K1CZpda1l2Co4DhWPRvKivrYo25fy5fyelFQ
         LOSU8z3Mz488p3gEaHFbADJmHV591Q6KhhN/CiErXmrwRcATiNlNGAeSkPadz50SFf77
         S8v8VLcBKsIqyo8t1xj9h6EXvV4R1jcFhacnzjm1Rl6dhAlEv2eaUIf6mmx4cQr/ojkS
         X7Mg==
X-Gm-Message-State: AOAM530v2yATBI9aE6IJdDz4xWNbg9z/FEpE2/V8UTeRJ7o6M3AfAAEM
        XtAEY/ZezqJ0HI8SDItmDDhlSsoqDAY=
X-Google-Smtp-Source: ABdhPJxxyU6hdrXj1vTUK8w4Jtxldh4HC0Kkl0dY99VjUcbxDIk/mvBPCOWtqralg+3UO+K/yH3IKw==
X-Received: by 2002:a05:6830:120b:: with SMTP id r11mr153605otp.173.1627607668533;
        Thu, 29 Jul 2021 18:14:28 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id u3sm31794otg.15.2021.07.29.18.14.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 29 Jul 2021 18:14:27 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Subject: Re: [PATCH 2/3] dt-bindings: watchdog: sunxi: Add compatible for D1
To:     Rob Herring <robh@kernel.org>
Cc:     Samuel Holland <samuel@sholland.org>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Maxime Ripard <mripard@kernel.org>,
        Chen-Yu Tsai <wens@csie.org>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-sunxi@lists.linux.dev, linux-watchdog@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20210726035143.53132-1-samuel@sholland.org>
 <20210726035143.53132-2-samuel@sholland.org>
 <20210729042449.GA1716994@roeck-us.net> <YQMuM2McwNGzqAhe@robh.at.kernel.org>
From:   Guenter Roeck <linux@roeck-us.net>
Message-ID: <0a5956b2-f9d6-ce92-a517-37e67da81324@roeck-us.net>
Date:   Thu, 29 Jul 2021 18:14:25 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <YQMuM2McwNGzqAhe@robh.at.kernel.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On 7/29/21 3:39 PM, Rob Herring wrote:
> On Wed, Jul 28, 2021 at 09:24:49PM -0700, Guenter Roeck wrote:
>> On Sun, Jul 25, 2021 at 10:51:42PM -0500, Samuel Holland wrote:
>>> D1 keeps the same register layout and clock sources as the R329, but it
>>> adds a key field which must be set to update the watchdog's "CFG" and
>>> "MODE" registers. Therefore it is not backward-compatible.
>>>
>>> Signed-off-by: Samuel Holland <samuel@sholland.org>
>>> ---
>>>   .../devicetree/bindings/watchdog/allwinner,sun4i-a10-wdt.yaml   | 2 ++
>>>   1 file changed, 2 insertions(+)
>>>
>>> diff --git a/Documentation/devicetree/bindings/watchdog/allwinner,sun4i-a10-wdt.yaml b/Documentation/devicetree/bindings/watchdog/allwinner,sun4i-a10-wdt.yaml
>>> index 853ceb1b7c0f..756e6ab99860 100644
>>> --- a/Documentation/devicetree/bindings/watchdog/allwinner,sun4i-a10-wdt.yaml
>>> +++ b/Documentation/devicetree/bindings/watchdog/allwinner,sun4i-a10-wdt.yaml
>>> @@ -29,6 +29,7 @@ properties:
>>>         - items:
>>>             - const: allwinner,suniv-f1c100s-wdt
>>>             - const: allwinner,sun4i-a10-wdt
>>> +      - const: allwinner,sun20i-d1-wdt
>>
>> Alignment is off.
> 
> No, it's correct. It's not part of the above list, but a new 'oneOf'
> entry.
> 

Ok, I really should not try to review devicetree files.

Thanks,
Guenter
