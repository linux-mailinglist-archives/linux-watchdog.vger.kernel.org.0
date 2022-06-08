Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CD9A6542D1C
	for <lists+linux-watchdog@lfdr.de>; Wed,  8 Jun 2022 12:21:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236639AbiFHKU4 (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Wed, 8 Jun 2022 06:20:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36914 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237744AbiFHKUG (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Wed, 8 Jun 2022 06:20:06 -0400
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com [IPv6:2a00:1450:4864:20::62b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 219289D071
        for <linux-watchdog@vger.kernel.org>; Wed,  8 Jun 2022 03:08:52 -0700 (PDT)
Received: by mail-ej1-x62b.google.com with SMTP id bg6so20632889ejb.0
        for <linux-watchdog@vger.kernel.org>; Wed, 08 Jun 2022 03:08:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=0nZ0iMJU6C7UG79cViLeyIi770dja43K/FzVTu1SAO4=;
        b=HorJq1vsgKHjyX4WFHpymYLZ8u4aemLph5q4pXSNAi73bZXhP2igaMroKFAfnfmfnI
         IHDbuJeHqxvwMciTuWnPoNwod3JoL/T/3aEf3CvZhw+hrgA2GmCA0sFS0LvA8dPHbXol
         vCuI0zrNLk4AgVvqyzGt1kbrDuAHy5qj6xWlweQ3/0o9fEZfGdBGXA9za+1vaiM8C3Eg
         eWzuuA8P8eoAJeoNsseQhLHLXlc2TisoesAPJvS85d3J4MKfauDtylO1TMpfds49WS99
         ikDqo/DlDqeo9PN0KajsAnduudZbPn5KNbOFSLgofroMglHMsG0Myw9ju/3WkO98DRdA
         JJaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=0nZ0iMJU6C7UG79cViLeyIi770dja43K/FzVTu1SAO4=;
        b=mns/vhTx/BBszdyFi0W64aZxmRJJagBq0v5IctkawjXxtkV3d9AAJQGaLvdLppLyVr
         Q8bnFYg8brurL7C+K/q8KELLhkhplsatzA6757K49pyjPCn4kS3SPsSYlIIdqtyaGHQf
         6qA9kDhDxLPvEHz9sCNPpSET5AJemWc8pE/RIRj+X60BP4TBrsJ1aCkPkQ1FpOrRbUmL
         wjc+78W2SPKBe6aZALm1ky3PUVNVuCLssn36z97Tc2HLSiC/hmT9QL1i+9Iu+ZYm8mm8
         JDiJlx/CRSFbnU25fzNqgbaufUYfXIdgomC6G+FdT0L2tY6n2isXhg3KDcWauhNy5KVj
         TiFQ==
X-Gm-Message-State: AOAM531H/WF2PgFo18fp9LGUWmQoJF2jo5kvOPkm5lFjb7199Lj0xL5Z
        4Uwex0chhecygkfE6VnzjjqZqSTgMiN6eQ==
X-Google-Smtp-Source: ABdhPJwv2k1lCiK72rw9Hy/n4bajQh3E+7H09B6IQPYxA2+JeIsbmwpfmrHi0IrppI52n4fRpSaFGA==
X-Received: by 2002:a17:907:d29:b0:711:d215:5a5e with SMTP id gn41-20020a1709070d2900b00711d2155a5emr12740253ejc.697.1654682930680;
        Wed, 08 Jun 2022 03:08:50 -0700 (PDT)
Received: from [192.168.0.191] (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id d5-20020a170906344500b006fee98045cdsm9027012ejb.10.2022.06.08.03.08.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 Jun 2022 03:08:49 -0700 (PDT)
Message-ID: <91549b70-08fc-ed6f-c48e-5bcb70ea63d0@linaro.org>
Date:   Wed, 8 Jun 2022 12:08:48 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH v2 11/20] reset: npcm: using syscon instead of device data
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
References: <20220608095623.22327-1-tmaimon77@gmail.com>
 <20220608095623.22327-12-tmaimon77@gmail.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220608095623.22327-12-tmaimon77@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On 08/06/2022 11:56, Tomer Maimon wrote:
> Using syscon device tree property instead of
> device data to handle the NPCM general control
> registers.
> 

Again ignored the comment.

> Signed-off-by: Tomer Maimon <tmaimon77@gmail.com>
> ---
>  drivers/reset/reset-npcm.c | 11 +++--------
>  1 file changed, 3 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/reset/reset-npcm.c b/drivers/reset/reset-npcm.c
> index 2ea4d3136e15..312c3b594b8f 100644
> --- a/drivers/reset/reset-npcm.c
> +++ b/drivers/reset/reset-npcm.c
> @@ -138,8 +138,7 @@ static int npcm_reset_xlate(struct reset_controller_dev *rcdev,
>  }
>  
>  static const struct of_device_id npcm_rc_match[] = {
> -	{ .compatible = "nuvoton,npcm750-reset",
> -		.data = (void *)"nuvoton,npcm750-gcr" },
> +	{ .compatible = "nuvoton,npcm750-reset"},
>  	{ }
>  };
>  
> @@ -155,14 +154,10 @@ static int npcm_usb_reset(struct platform_device *pdev, struct npcm_rc_data *rc)
>  	u32 ipsrst1_bits = 0;
>  	u32 ipsrst2_bits = NPCM_IPSRST2_USB_HOST;
>  	u32 ipsrst3_bits = 0;
> -	const char *gcr_dt;
>  
> -	gcr_dt = (const char *)
> -	of_match_device(dev->driver->of_match_table, dev)->data;
> -
> -	gcr_regmap = syscon_regmap_lookup_by_compatible(gcr_dt);
> +	gcr_regmap = syscon_regmap_lookup_by_phandle(dev->of_node, "nuvoton,sysgcr");
>  	if (IS_ERR(gcr_regmap)) {
> -		dev_err(&pdev->dev, "Failed to find %s\n", gcr_dt);
> +		dev_err(&pdev->dev, "Failed to find gcr syscon");
>  		return PTR_ERR(gcr_regmap);

Comment still ignored.

There is no point in this review if you keep ignoring what we ask to fix.

If something is unclear, ask for clarification. Resending without
implementing the comment means that you ignore the review which is waste
of my time.

I am sorry, but this is not acceptable.

Best regards,
Krzysztof
