Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 85BCA7177F6
	for <lists+linux-watchdog@lfdr.de>; Wed, 31 May 2023 09:22:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234638AbjEaHWv (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Wed, 31 May 2023 03:22:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34268 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234623AbjEaHWg (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Wed, 31 May 2023 03:22:36 -0400
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com [IPv6:2a00:1450:4864:20::534])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 061AAE76
        for <linux-watchdog@vger.kernel.org>; Wed, 31 May 2023 00:21:56 -0700 (PDT)
Received: by mail-ed1-x534.google.com with SMTP id 4fb4d7f45d1cf-5151934a4e3so81837a12.1
        for <linux-watchdog@vger.kernel.org>; Wed, 31 May 2023 00:21:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1685517712; x=1688109712;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=K4TAHA7x0iJF7j81brHbSoY+8EOqngGbbUKsqhzvURM=;
        b=ZeoMnpARxNKsfrE567KvKbKauHAZbdpvkdg1din0saFWLU+qjDf3U1UM21aGQDFn0k
         RKpvSX2ve8SLu8C0ECLeIF+aAPffF/we77TPGmz4MTg7zWAbN0zkRXZsBPqAYG1uM4AK
         bdQ+Lmzy3mn77596i9QSc7aZfbbpRNU80rfqNUPiLkL1R0fzs1lRvLwpST8sm6Qd4+/l
         v0kMrlgLeGqRK2h+o46vK6CRv+KTMAmgHmjhOlv5SDX6vrgG8r23qlEOGXiJrcliWvz0
         1v1npevZ0s+PD7oFBqAS/v2nC/rvpCtvqXl69vmbfhw3eXPZGlSP0lp1Tsg/k/FoU873
         wjHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685517712; x=1688109712;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=K4TAHA7x0iJF7j81brHbSoY+8EOqngGbbUKsqhzvURM=;
        b=kCCuf63JPsCQXO3x+xvQLDhh/b1ETEvqlwi+NqzldQjQZc4Xxik1rXl5WbnjTYR+BQ
         TUk5s8Z76TIJjNswj0XFynJkVQ8CEzDiltU8ZoVHMxKmlFNGfu8m4m2uqqm/qgVq1Gpj
         PAyBuzSCXYqNbOmLo7Ov9fcPwGwebM9oDdbn4vFTSLNuB3McZa3HzoYpSFXIM+WOGyUN
         otderlzamE9OtdzaKjH3wYxSinLKm0neAiU+v3Bge6Pp25fmB01eQKUEH76VX58Hnp7c
         msevHrmQu7rBJ4JyfBCivsryy1EldCxfPCb0kRqXbdtb2KEpmc76/k3K1LLHOPOwqc9+
         6N0A==
X-Gm-Message-State: AC+VfDySVDDFvB13UYXDHWEUxR/WYTHKGud7YAfYEaRjH9N/wWEh4iyE
        2wn/ppaqNptRYjMwJ8AbPlrI7A==
X-Google-Smtp-Source: ACHHUZ5hrn3tCdyfOdPtVUqhfID3kWZCZIiOWYvMvR5CcygQTLPxTL5zulWCgdk+sGzPVPC5+44ung==
X-Received: by 2002:a05:6402:392:b0:50d:88f3:2e30 with SMTP id o18-20020a056402039200b0050d88f32e30mr3107652edv.13.1685517712533;
        Wed, 31 May 2023 00:21:52 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.199.204])
        by smtp.gmail.com with ESMTPSA id i16-20020a056402055000b0050a276e7ba8sm5267379edx.36.2023.05.31.00.21.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 31 May 2023 00:21:52 -0700 (PDT)
Message-ID: <52309a2e-f314-5644-96fe-110b8c277e58@linaro.org>
Date:   Wed, 31 May 2023 09:21:50 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH] dt-bindings: watchdog: cdns,wdt-r1p2: Convert cadence
 watchdog to yaml
Content-Language: en-US
To:     Srinivas Neeli <srinivas.neeli@amd.com>, wim@linux-watchdog.org,
        linux@roeck-us.net, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org
Cc:     linux-watchdog@vger.kernel.org, linux-kernel@vger.kernel.org,
        radhey.shyam.pandey@amd.com, git@amd.com,
        neelisrinivas18@gmail.com, srinivas.goud@amd.com
References: <20230531052812.2221823-1-srinivas.neeli@amd.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230531052812.2221823-1-srinivas.neeli@amd.com>
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

On 31/05/2023 07:28, Srinivas Neeli wrote:
> Convert cadence watchdog bindings to DT schema format using json-schema.
> 
> Signed-off-by: Srinivas Neeli <srinivas.neeli@amd.com>
> ---

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

