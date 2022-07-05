Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 36041567806
	for <lists+linux-watchdog@lfdr.de>; Tue,  5 Jul 2022 21:50:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232883AbiGETuq (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Tue, 5 Jul 2022 15:50:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47000 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231869AbiGETuq (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Tue, 5 Jul 2022 15:50:46 -0400
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com [IPv6:2a00:1450:4864:20::42c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 36C761CB10
        for <linux-watchdog@vger.kernel.org>; Tue,  5 Jul 2022 12:50:44 -0700 (PDT)
Received: by mail-wr1-x42c.google.com with SMTP id v16so7582970wrd.13
        for <linux-watchdog@vger.kernel.org>; Tue, 05 Jul 2022 12:50:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=references:user-agent:from:to:cc:subject:date:in-reply-to
         :message-id:mime-version;
        bh=r8/0ZA0cdDqN2NnSWqxUYORUadal9PFtP6t/aV1KcUw=;
        b=QDyNEjwt8jCOFKmVmOz51PmC22Xtmo4y6ANbnIbf7vTmALffsQFEn3b0SfY95Xs6XY
         StEcZLt7rPwuOuNu4U8kcY/e7iSq/jvOPH3To1xBijA2ePnM1WXKcF+f/Cm12kNxpchC
         aLVMEF8udPULxRIOGsi07WkD/2Htb141j7fZ5gby5z4X1iiSneWcZ+057VyMUw+kozy7
         hiQNo+L/4RDHocqVaKuHpGlsHHb191B+CxsJ733h/TbzapMBV7kY5HtZBx92nasY7rlh
         xhiSz0tRf/gSME/U95Nhnojf40K857J1RCdqoVLKx66X1YElZcMANtv3kAmRsOgbGinh
         oJKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
         :in-reply-to:message-id:mime-version;
        bh=r8/0ZA0cdDqN2NnSWqxUYORUadal9PFtP6t/aV1KcUw=;
        b=X7DDVnw1JaVnxFDC/cpX5QF5Ds3U5rxsA8uL0VoHXYuPU8RBvHy8dDWXT7VueE7xrl
         Xr7tYLDWTwLynU4FZLwCjJ+MuMqP6ZeDt0J/UahhdYJiSjUm5w8gbxIc+d1S7uNo4wGB
         RICi1rKIpmTAsB1FNQK1/ntuj++WRl57PCwhoK97y2jGvsIcMNHKzZPBSpcyI+SOsIag
         QLaSSqq7boOZcgcmGL39ZQXN3sHP9yOVEvYqJfsan9cEWlCZ44yzp/DTioJ4Ul7vGdoe
         YS4fbsHSz706S6foXHGGMSsaIaz5Hgc4qdKcwqZ78lVnF/IqW/wXILPGB3DgLOI0p4sE
         KOBA==
X-Gm-Message-State: AJIora8wIf+7Hay4Eky+wTNDHHmdAowWJxX0eoTcJgD0eCNklLV7y1GP
        NmPFGmdwE+eFc/YUe+5tVxa4wg==
X-Google-Smtp-Source: AGRyM1t4VJeJWG18aGWqK1uBLyW34gcIgRkYi+KE9OO5+cMEcmfCc/8n7ObhkC/951z3k5iY2UhS5A==
X-Received: by 2002:a5d:66c1:0:b0:21d:6c98:7aa4 with SMTP id k1-20020a5d66c1000000b0021d6c987aa4mr9956115wrw.136.1657050642786;
        Tue, 05 Jul 2022 12:50:42 -0700 (PDT)
Received: from localhost (82-65-169-74.subs.proxad.net. [82.65.169.74])
        by smtp.gmail.com with ESMTPSA id c21-20020a05600c0a5500b0039c4d022a44sm24170705wmq.1.2022.07.05.12.50.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Jul 2022 12:50:42 -0700 (PDT)
References: <20220705142444.17063-1-pboos@baylibre.com>
 <f756b2d5-56e7-6e52-2739-eca4bb33508b@baylibre.com>
User-agent: mu4e 1.8.2; emacs 27.1
From:   Jerome Brunet <jbrunet@baylibre.com>
To:     Neil Armstrong <narmstrong@baylibre.com>
Cc:     Philippe Boos <pboos@baylibre.com>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Kevin Hilman <khilman@baylibre.com>,
        Jerome Brunet <jbrunet@baylibre.com>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        linux-watchdog@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1] watchdog: meson: keep running if already active
Date:   Tue, 05 Jul 2022 21:29:35 +0200
In-reply-to: <f756b2d5-56e7-6e52-2739-eca4bb33508b@baylibre.com>
Message-ID: <1jmtdnwd7y.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org


On Tue 05 Jul 2022 at 16:39, Neil Armstrong <narmstrong@baylibre.com> wrote:

> Hi,
>
> On 05/07/2022 16:24, Philippe Boos wrote:
>> If the watchdog is already running (e.g.: started by bootloader) then
>> the kernel driver should keep the watchdog active but the amlogic driver
>> turns it off.
>> Let the driver fix the clock rate then restart the watchdog if it was
>> previously active.
>> Reviewed-by: Jerome Brunet <jbrunet@baylibre.com>
>
> Please drop this review tag since it was done off-list

Indeed a review was done off-list.

Reviewed-by says a review has been done. I was not aware this applied to
public reviews only. I probably missed that, would you mind pointing me
to that rule please ?

>
>> Signed-off-by: Philippe Boos <pboos@baylibre.com>
>> ---
>>   drivers/watchdog/meson_gxbb_wdt.c | 10 ++++++++++
>>   1 file changed, 10 insertions(+)
>> diff --git a/drivers/watchdog/meson_gxbb_wdt.c
>> b/drivers/watchdog/meson_gxbb_wdt.c
>> index 5a9ca10fbcfa..8c2c6f7f3bb5 100644
>> --- a/drivers/watchdog/meson_gxbb_wdt.c
>> +++ b/drivers/watchdog/meson_gxbb_wdt.c
>> @@ -146,6 +146,7 @@ static int meson_gxbb_wdt_probe(struct platform_device *pdev)
>>   	struct device *dev = &pdev->dev;
>>   	struct meson_gxbb_wdt *data;
>>   	int ret;
>> +	u32 regval;
>>     	data = devm_kzalloc(dev, sizeof(*data), GFP_KERNEL);
>>   	if (!data)
>> @@ -177,6 +178,8 @@ static int meson_gxbb_wdt_probe(struct platform_device *pdev)
>>   	data->wdt_dev.timeout = DEFAULT_TIMEOUT;
>>   	watchdog_set_drvdata(&data->wdt_dev, data);
>>   +	regval = readl(data->reg_base + GXBB_WDT_CTRL_REG); > +
>>   	/* Setup with 1ms timebase */
>>   	writel(((clk_get_rate(data->clk) / 1000) & GXBB_WDT_CTRL_DIV_MASK) |
>>   		GXBB_WDT_CTRL_EE_RESET |
>> @@ -186,6 +189,13 @@ static int meson_gxbb_wdt_probe(struct platform_device *pdev)
>>     	meson_gxbb_wdt_set_timeout(&data->wdt_dev, data->wdt_dev.timeout);
>>   +	if ((regval & GXBB_WDT_CTRL_EN) != 0) {
>> +		ret = meson_gxbb_wdt_start(&data->wdt_dev);
>> +		if (ret)
>> +			return ret;
>> +		set_bit(WDOG_HW_RUNNING, &data->wdt_dev.status);
>> +	}
>> +
>>   	watchdog_stop_on_reboot(&data->wdt_dev);
>>   	return devm_watchdog_register_device(dev, &data->wdt_dev);
>>   }
>
> I think it would be much claner to leave the watchdog enabled, and get the
> parameters
> from the registers and update the wdt_dev accordingly.

The problem is updating the time base (ie, the clock divider) while the
watchdog is running. We should not make an assumption about what the
bootloader is going to leave us.

It could be safe if we could update the divider, the timeout and ping
the watchdog with a single write. There is several registers for
that, so not possible. It is safer to update the divider with the
watchdog off.

There is indeed a small window of opportunity were a crash could happen
with the watchdog off. What is proposed here is progress compared to
what we have right now, which is waiting for userspace to come up to
start the watchdog again.

The only safe way to keep the watchdog on throughout is to keep whatever
time base was set by the bootloader. That means major rework since the whole
driver rely on a 1ms time base. I'm not sure re-using the bootloader
settings is such a great idea anyway. 

>
> Neil

