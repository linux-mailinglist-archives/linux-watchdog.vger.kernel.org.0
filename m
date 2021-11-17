Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C3649454E94
	for <lists+linux-watchdog@lfdr.de>; Wed, 17 Nov 2021 21:31:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231796AbhKQUea (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Wed, 17 Nov 2021 15:34:30 -0500
Received: from relay2-d.mail.gandi.net ([217.70.183.194]:38011 "EHLO
        relay2-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229606AbhKQUe3 (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Wed, 17 Nov 2021 15:34:29 -0500
Received: (Authenticated sender: alexandre.belloni@bootlin.com)
        by relay2-d.mail.gandi.net (Postfix) with ESMTPSA id 6563140004;
        Wed, 17 Nov 2021 20:31:27 +0000 (UTC)
Date:   Wed, 17 Nov 2021 21:31:27 +0100
From:   Alexandre Belloni <alexandre.belloni@bootlin.com>
To:     Luca Ceresoli <luca@lucaceresoli.net>
Cc:     linux-kernel@vger.kernel.org, Lee Jones <lee.jones@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>, devicetree@vger.kernel.org,
        linux-rtc@vger.kernel.org, linux-watchdog@vger.kernel.org,
        Chiwoong Byun <woong.byun@samsung.com>,
        Laxman Dewangan <ldewangan@nvidia.com>,
        Randy Dunlap <rdunlap@infradead.org>
Subject: Re: [PATCH v3 3/8] rtc: max77686: remove unused code to read in
 12-hour mode
Message-ID: <YZVmnwFDrXPA0nzC@piout.net>
References: <20211111225852.3128201-1-luca@lucaceresoli.net>
 <20211111225852.3128201-4-luca@lucaceresoli.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211111225852.3128201-4-luca@lucaceresoli.net>
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On 11/11/2021 23:58:47+0100, Luca Ceresoli wrote:
> The MAX77714 RTC chip is explicitly set to 24-hour mode in
> max77686_rtc_probe() -> max77686_rtc_init_reg() and never changed back to
> 12-hour mode. Accordingly info->rtc_24hr_mode is set to 1 in the same place
> and never modified later, so it is de facto a constant. Yet there is code
> to read 12-hour time, which is unreachable.
> 
> Remove the unused variable, the unreachable code to manage 12-hour mode and
> the defines that become unused due to the above changes.
> 
> Signed-off-by: Luca Ceresoli <luca@lucaceresoli.net>
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Acked-by: Alexandre Belloni <alexandre.belloni@bootlin.com>

> 
> ---
> 
> Changes in v3: none
> 
> Changes in v2:
>  - remove the now-unused defines too (Alexandre Belloni)
>  - improve the commit message
> ---
>  drivers/rtc/rtc-max77686.c | 14 +-------------
>  1 file changed, 1 insertion(+), 13 deletions(-)
> 
> diff --git a/drivers/rtc/rtc-max77686.c b/drivers/rtc/rtc-max77686.c
> index 7e765207f28e..5c64d08c0732 100644
> --- a/drivers/rtc/rtc-max77686.c
> +++ b/drivers/rtc/rtc-max77686.c
> @@ -34,9 +34,6 @@
>  #define RTC_UDR_MASK			BIT(RTC_UDR_SHIFT)
>  #define RTC_RBUDR_SHIFT			4
>  #define RTC_RBUDR_MASK			BIT(RTC_RBUDR_SHIFT)
> -/* RTC Hour register */
> -#define HOUR_PM_SHIFT			6
> -#define HOUR_PM_MASK			BIT(HOUR_PM_SHIFT)
>  /* RTC Alarm Enable */
>  #define ALARM_ENABLE_SHIFT		7
>  #define ALARM_ENABLE_MASK		BIT(ALARM_ENABLE_SHIFT)
> @@ -99,7 +96,6 @@ struct max77686_rtc_info {
>  
>  	int rtc_irq;
>  	int virq;
> -	int rtc_24hr_mode;
>  };
>  
>  enum MAX77686_RTC_OP {
> @@ -278,13 +274,7 @@ static void max77686_rtc_data_to_tm(u8 *data, struct rtc_time *tm,
>  
>  	tm->tm_sec = data[RTC_SEC] & mask;
>  	tm->tm_min = data[RTC_MIN] & mask;
> -	if (info->rtc_24hr_mode) {
> -		tm->tm_hour = data[RTC_HOUR] & 0x1f;
> -	} else {
> -		tm->tm_hour = data[RTC_HOUR] & 0x0f;
> -		if (data[RTC_HOUR] & HOUR_PM_MASK)
> -			tm->tm_hour += 12;
> -	}
> +	tm->tm_hour = data[RTC_HOUR] & 0x1f;
>  
>  	/* Only a single bit is set in data[], so fls() would be equivalent */
>  	tm->tm_wday = ffs(data[RTC_WEEKDAY] & mask) - 1;
> @@ -662,8 +652,6 @@ static int max77686_rtc_init_reg(struct max77686_rtc_info *info)
>  	data[0] = (1 << BCD_EN_SHIFT) | (1 << MODEL24_SHIFT);
>  	data[1] = (0 << BCD_EN_SHIFT) | (1 << MODEL24_SHIFT);
>  
> -	info->rtc_24hr_mode = 1;
> -
>  	ret = regmap_bulk_write(info->rtc_regmap,
>  				info->drv_data->map[REG_RTC_CONTROLM],
>  				data, ARRAY_SIZE(data));
> -- 
> 2.25.1
> 

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
