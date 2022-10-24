Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EC6AB60AE90
	for <lists+linux-watchdog@lfdr.de>; Mon, 24 Oct 2022 17:08:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232083AbiJXPH6 (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Mon, 24 Oct 2022 11:07:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47246 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231843AbiJXPHX (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Mon, 24 Oct 2022 11:07:23 -0400
Received: from mail-pj1-x102e.google.com (mail-pj1-x102e.google.com [IPv6:2607:f8b0:4864:20::102e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D923013CEB
        for <linux-watchdog@vger.kernel.org>; Mon, 24 Oct 2022 06:44:13 -0700 (PDT)
Received: by mail-pj1-x102e.google.com with SMTP id h14so8150401pjv.4
        for <linux-watchdog@vger.kernel.org>; Mon, 24 Oct 2022 06:44:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Jh8UQ4JmTZN9hL0/8CXAkNYRnuwMy/n4/v6mITjc4KY=;
        b=y0W+zUyiBftSd0JgAGoPOqPtmV13guRpqzbMHskUNvLCEuQ6pihIc7oGP6TuC3oQt5
         NjC6zT2GBgFpwt3TaO3sCktoTg2zHU1fTtWzfcwSmh6ykgmIp95Eot8a0sqsecpFyW7x
         1HT6dR9s6lU9w8AQMYPhYLXd1Gu3x1edoP1WhBwFF/jIaERMSCG6bAABteTZbOS+Taz8
         m7SCCh9de8RQXNTOTCxekuN5wUYGpUE+af/pdLsiLsH9H7ozUi1IJplIrGjD7sC4Tf7t
         s+A+OHtLvPIWSHgE+4xzSs5FzW53+pzJ7Liv/i1SA0R2VvOs5lkPyZK2zhrwcwhQeqwz
         cUfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Jh8UQ4JmTZN9hL0/8CXAkNYRnuwMy/n4/v6mITjc4KY=;
        b=NBbP1lLYgOZtVqkdlqrFWyY85bSGB+EJAzBOojkniO6L3B3GCuX1S8E28iS2eX1n7w
         jXoRjYYZh5CHWvw6RYZ09pvN8F0xZ2lLOhoffbNGEW+Cd38cbtRGOH5llwUm1oxpb0AW
         TkwSchOwEPgDsSIzaLmdHVtKnr9qNhLbPUGQIvaqIye5rAaWjRBphq4/mFJ7RDbfLvhV
         IZrlykg6IZpKc/pI0g0/0W3kK5CkII5rh8pO1qnz6nHxd2lz+7bZAlmnDAAN54lxE8Oi
         2HkdsV3g9t9F01x7ed2bG60EHkR5mqAHXvZVx1bbePOsqaTlJBUNFSeGV1+fz4CIGqBd
         PTwA==
X-Gm-Message-State: ACrzQf0nPmQNwlZcqIgjXyfDb7NJzH0hPNA3iOtPiGFrVDfjCDDc7PBo
        88BhqDnCvGP0RvJQQnlGQc97/FYzhW95hA==
X-Google-Smtp-Source: AMsMyM64HS96JA+t5NegWTBhGoXrPmUTvN8S9j1oIuC6j5JnhVzd28Edhbio8VxlddWIvdR7T0/thQ==
X-Received: by 2002:a0c:8ccc:0:b0:4b2:382e:ddaa with SMTP id q12-20020a0c8ccc000000b004b2382eddaamr27200510qvb.33.1666614368794;
        Mon, 24 Oct 2022 05:26:08 -0700 (PDT)
Received: from [192.168.1.8] ([64.57.193.93])
        by smtp.gmail.com with ESMTPSA id u30-20020a37ab1e000000b006ef0350db8asm9109052qke.128.2022.10.24.05.26.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 24 Oct 2022 05:26:08 -0700 (PDT)
Message-ID: <a354c24d-0355-7c9d-ad05-4c21561af4dc@linaro.org>
Date:   Mon, 24 Oct 2022 08:26:05 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.0
Subject: Re: [PATCH 02/21] ARM: s3c: remove s3c24xx specific hacks
Content-Language: en-US
To:     Arnd Bergmann <arnd@kernel.org>,
        linux-arm-kernel@lists.infradead.org
Cc:     linux-kernel@vger.kernel.org, Ben Dooks <ben-linux@fluff.org>,
        Simtec Linux Team <linux@simtec.co.uk>,
        Arnd Bergmann <arnd@arndb.de>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Jonathan Cameron <jic23@kernel.org>,
        Lars-Peter Clausen <lars@metafoo.de>,
        Sylwester Nawrocki <sylvester.nawrocki@gmail.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        Miquel Raynal <miquel.raynal@bootlin.com>,
        Richard Weinberger <richard@nod.at>,
        Vignesh Raghavendra <vigneshr@ti.com>,
        Tomasz Figa <tomasz.figa@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jiri Slaby <jirislaby@kernel.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Stephen Boyd <sboyd@kernel.org>,
        linux-samsung-soc@vger.kernel.org, linux-i2c@vger.kernel.org,
        linux-iio@vger.kernel.org, linux-media@vger.kernel.org,
        linux-mmc@vger.kernel.org, linux-mtd@lists.infradead.org,
        linux-gpio@vger.kernel.org, linux-rtc@vger.kernel.org,
        linux-serial@vger.kernel.org, linux-usb@vger.kernel.org,
        linux-watchdog@vger.kernel.org, linux-clk@vger.kernel.org
References: <20221021202254.4142411-1-arnd@kernel.org>
 <20221021203329.4143397-2-arnd@kernel.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221021203329.4143397-2-arnd@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On 21/10/2022 16:27, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> A number of device drivers reference CONFIG_ARM_S3C24XX_CPUFREQ or
> similar symbols that are no longer available with the platform gone,
> though the drivers themselves are still used on newer platforms,
> so remove these hacks.
> 
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

