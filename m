Return-Path: <linux-watchdog+bounces-3419-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 382F8AA7562
	for <lists+linux-watchdog@lfdr.de>; Fri,  2 May 2025 16:54:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C3A56987AB1
	for <lists+linux-watchdog@lfdr.de>; Fri,  2 May 2025 14:54:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BC9EF256C8A;
	Fri,  2 May 2025 14:54:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WcbOSsGN"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E16CB254861
	for <linux-watchdog@vger.kernel.org>; Fri,  2 May 2025 14:54:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746197668; cv=none; b=fy+Ig2eoY83aL+zlsqZf+XsAfDarPDr26DNgUZ9hP8MhEB5LRYvZXXo+8CFfgW3X5e9OHcUIXGtjz77TJh5DnswmiiUPq+UzSZtBvX7gGJU+/LUAGfOYSsD+v8SnB6b/aUNNx/EBpE1S/SNntndu26yKuVoURaJ9EHZ4YCqAX+Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746197668; c=relaxed/simple;
	bh=n5mbVutTTdA75c430IqNM7iDH8/4xuyXNJAQmbwMjUU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=amb2FhwQhDM3rUFeX8GeaaIoNfc6Xcw4MJ3jpt8QqVmL99ay4GTsmpm0wHYR1R8SnawftXQaTQCjSQXsthC7/GGyONco8xmFGxKzrna4yzgTxDCsnkDhcrJSWifMYyVSQtKNmjRohjUWLfDaqwgl0vrJFQ+PzPZAPPSfAa7vbXE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WcbOSsGN; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 542EaL5k015009
	for <linux-watchdog@vger.kernel.org>; Fri, 2 May 2025 14:54:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=qE/jsvPg905w0/spqoOjWTuo
	z5yjxf8U+JSEYe0nzlo=; b=WcbOSsGN/c0sFyFBfIc5Rky471HlcoA7imjJ4rFb
	2mkJtrF04Z7h2SROOTRBXgOtwZ3THkJxS/l/rZmjQfypV9cuavXASaKWyjyAfhlo
	h/kDqWDeBfRFxSqH1Bju3iVnqdwQCaToGB3/eK4S3ue7t1VCb0qVR6ro+hjM11bM
	U7D4snXDPQ328LcNksud4dGaR66HKKM9IqX9nTCaEWaQt+qtAmlE3pB2GrsgQeic
	IA6lyZGe3PTZ+qcgZsRpa87qat/t35uQk7WrkDfjY7zQyiKMOX5shduWcDMdV2Vh
	N15uh5ypS2QXJ3vDGIENrF8ql0qFclxDgFDdZaFXWfrtVA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46b6ub0jww-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-watchdog@vger.kernel.org>; Fri, 02 May 2025 14:54:25 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-7c5c9abdbd3so210478485a.1
        for <linux-watchdog@vger.kernel.org>; Fri, 02 May 2025 07:54:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746197665; x=1746802465;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qE/jsvPg905w0/spqoOjWTuoz5yjxf8U+JSEYe0nzlo=;
        b=a01p6XfI14yfY8ZPnwZToaoQkdeOyt61zB9tmorQqKL2/O3Q7g1mjNFSFId7Q7shww
         vDbwPjE62vxC2k75+YpLNYpI1mbL+7jJvkHUmbdJBsfmpKjrJS86bnMgrYla1vmfnAQn
         N4fXVuR9kJyYv7xvufgv2pxgQin81/eFR8xpd8gFW6P+IOCI08gn+3dH67OJQYMi1IRO
         MdbWaMwTJddSw8HYWibF0Q/SSspQqneqIUhoEUTMNPRXjqNjX+d7e3W7pLlXU72+N8CY
         AbcVtVTww+g5o6Z0xRGNOYr7teQrqNJMvzcwdvoGZFnkESR3AfCuxplz9roHcbZnby7I
         lDHw==
X-Forwarded-Encrypted: i=1; AJvYcCVUeZVZyT+diJa90LoFXME0I/AreR0XHUmUfK1HpqEkGaK7lm1YpIDhBSia7V5xRdZb4wV8ZhFYy0IDZCAkMQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YyGzJpWLNcyeks6l+RiDnvrC+sH7GPedV78TtqGMFGiN8Toxaoo
	FRWVZQSJ1MWn0Ns33a/CC0Dn/ts5XUJkvk3taGYHHUJgPuqMFytblCkD3kUh8b6Mf43ZziACN3r
	1EpTkPdTuEMFFJQEZbGKi7pCQLDiywbM29A9d6ucg0wfNAYj3pjwZp1DhSqymKUDltA==
X-Gm-Gg: ASbGnct3w+c579WKnvnSAiM3Cuc2YEW/j6Z3nA7Fz8QCq+8HwKBjYhrjN9xoIwVoMoh
	9ga75OQq6+BzISmVD2+nj3VbDVeAofx3ib/XmF09b//Gd1GpRwm7qm84j4QGW2tlaMq792e5kZ3
	rVckqhDBmQZZgUAaPGTwu+tqWv/FKMm9Eah5szSeLl4a9AVtTvjzOHAm3hBvS2WJ5hthUx27Yfa
	WUX11pnzqlv0pGty+J0Gtie0cm9bYlwANUujWc4Cz0X9QppA4si9hohx1MQrCCEFKyOk74x/KtL
	xNe0cHn3TyEsAe3pO1O3nR7MnSCpB7opN+M3mqyRGPeEmguFbuLfay0z8o2WKEZEWCw2qZIwGsw
	=
X-Received: by 2002:a05:620a:488c:b0:7ca:c9cb:abc with SMTP id af79cd13be357-7cad5b4d180mr417140485a.33.1746197664699;
        Fri, 02 May 2025 07:54:24 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFet1ZO0otbj5B/aLa36yQdNFxhUTegLhRDS2nexQF821IjSj7e9HTywZtuVlJ/LbIApJViog==
X-Received: by 2002:a05:620a:488c:b0:7ca:c9cb:abc with SMTP id af79cd13be357-7cad5b4d180mr417135285a.33.1746197664163;
        Fri, 02 May 2025 07:54:24 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54ea94ee6c1sm370305e87.110.2025.05.02.07.54.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 May 2025 07:54:23 -0700 (PDT)
Date: Fri, 2 May 2025 17:54:21 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>, bod.linux@nxsw.ie,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-watchdog@vger.kernel.org
Subject: Re: [PATCH v3 4/4] watchdog: qcom: add support to read the restart
 reason from IMEM
Message-ID: <gmoe3ykmns5hmmz6hdyxgzxiejb3nycghhvt3pgjysq6xa2zni@wpqyuz2pj5vy>
References: <20250502-wdt_reset_reason-v3-0-b2dc7ace38ca@oss.qualcomm.com>
 <20250502-wdt_reset_reason-v3-4-b2dc7ace38ca@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250502-wdt_reset_reason-v3-4-b2dc7ace38ca@oss.qualcomm.com>
X-Proofpoint-GUID: _s1fXmwkkd6ZXsKvDCrlujm_qK5hjw-u
X-Authority-Analysis: v=2.4 cv=KtlN2XWN c=1 sm=1 tr=0 ts=6814dca1 cx=c_pps a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=dt9VzEwgFbYA:10 a=EUspDBNiAAAA:8 a=d-kK87IHMynt6gTeNOsA:9 a=CjuIK1q_8ugA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-ORIG-GUID: _s1fXmwkkd6ZXsKvDCrlujm_qK5hjw-u
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTAyMDExOCBTYWx0ZWRfX82NpxeEo+sSt 7XUIibsRxMgjXYHbMky8QuQPrThqdBjv8xIt/n6pm02wE9BwpiiQm5u4mMljV9YALIRn9hPLl5M nDTOpfzYDIgjnUR7IvL8dmvaPEcJqO3iNGMiYFECjdmkuwGeud8Sna8QQh1hX1xr92pSQXSFfYi
 1TSUblSMQRKcyNAiBxiyZkqrv8ai2Q733gmo32VAD6iE2Ki9eS4a/Z2OWGLTygSZr+ehEiS/Xl/ Hgcc166iOu2yV04pvA3m5g9dA30NvkaQUfnZ0KVYbuPc4XhgWra50qUgIgEKmWPOwhQXM2pINLN hL0+qClMXoh/x3OG8gIxaJ8W6Qzd7Mml8FYN/Sgh9H1N59S2qw4+Uw9eWG5VrHuVTvGshPDcSGL
 NfLds+yob9C3BOEDpOTWGb++2OXvVfGXXbrR/f/qXXtIOQb5AlNEN6bL/KyjJHGqtk0E1y3v
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-02_02,2025-04-30_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 suspectscore=0
 lowpriorityscore=0 phishscore=0 adultscore=0 priorityscore=1501
 malwarescore=0 mlxscore=0 bulkscore=0 mlxlogscore=999 spamscore=0
 impostorscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2505020118

On Fri, May 02, 2025 at 06:47:52PM +0530, Kathiravan Thirumoorthy wrote:
> When the system boots up after a watchdog reset, the EXPIRED_STATUS bit
> in the WDT_STS register is cleared. To identify if the system was
> restarted due to WDT expiry, XBL update the information in the IMEM region.
> Update the driver to read the restart reason from IMEM and populate the
> bootstatus accordingly.
> 
> With the CONFIG_WATCHDOG_SYSFS enabled, user can extract the information
> as below:
> 
> cat /sys/devices/platform/soc@0/f410000.watchdog/watchdog/watchdog0/bootstatus
> 32
> 
> For backward compatibility, keep the EXPIRED_STATUS bit check. Add a new
> function qcom_wdt_get_restart_reason() to read the restart reason from
> IMEM.
> 
> Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
> ---
> Changes in v3:
> 	- Split the introduction of device data into separate patch
> 	- s/bootloaders/XBL - for clarity of which bootloader is
> 	  involved
> 	- Mention the sysfs path on to extract this information
> 	- s/compatible/imem_compatible in the device data structure to
> 	  avoid the confusion / better naming
> Changes in v2:
> 	- Use the syscon API to access the IMEM region
> 	- Handle the error cases returned by qcom_wdt_get_restart_reason
> 	- Define device specific data to retrieve the IMEM compatible,
> 	  offset and the value for non secure WDT, which allows to
> 	  extend the support for other SoCs
> ---
>  drivers/watchdog/qcom-wdt.c | 40 ++++++++++++++++++++++++++++++++++++++--
>  1 file changed, 38 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/watchdog/qcom-wdt.c b/drivers/watchdog/qcom-wdt.c
> index dfaac5995c84c1f377023e6e62770c5548528a4c..f2cb8bfdf53a5090bcfff6ea3a23005b629ef948 100644
> --- a/drivers/watchdog/qcom-wdt.c
> +++ b/drivers/watchdog/qcom-wdt.c
> @@ -7,9 +7,11 @@
>  #include <linux/interrupt.h>
>  #include <linux/io.h>
>  #include <linux/kernel.h>
> +#include <linux/mfd/syscon.h>
>  #include <linux/module.h>
>  #include <linux/of.h>
>  #include <linux/platform_device.h>
> +#include <linux/regmap.h>
>  #include <linux/watchdog.h>
>  
>  enum wdt_reg {
> @@ -42,6 +44,9 @@ struct qcom_wdt_match_data {
>  	const u32 *offset;
>  	bool pretimeout;
>  	u32 max_tick_count;
> +	const char *imem_compatible;
> +	unsigned int restart_reason_offset;
> +	unsigned int non_secure_wdt_val;
>  };
>  
>  struct qcom_wdt {
> @@ -185,6 +190,9 @@ static const struct qcom_wdt_match_data match_data_ipq5424 = {
>  	.offset = reg_offset_data_kpss,
>  	.pretimeout = true,
>  	.max_tick_count = 0xFFFFFU,
> +	.imem_compatible = "qcom,ipq5424-imem",
> +	.restart_reason_offset = 0x7b0,
> +	.non_secure_wdt_val = 0x5,
>  };
>  
>  static const struct qcom_wdt_match_data match_data_kpss = {
> @@ -193,6 +201,29 @@ static const struct qcom_wdt_match_data match_data_kpss = {
>  	.max_tick_count = 0xFFFFFU,
>  };
>  
> +static int  qcom_wdt_get_restart_reason(struct qcom_wdt *wdt,
> +					const struct qcom_wdt_match_data *data)
> +{
> +	struct regmap *imem;
> +	unsigned int val;
> +	int ret;
> +
> +	imem = syscon_regmap_lookup_by_compatible(data->imem_compatible);
> +	if (IS_ERR(imem))
> +		return PTR_ERR(imem);

Why? Just pass the syscon directly via DT.

> +
> +	ret = regmap_read(imem, data->restart_reason_offset, &val);
> +	if (ret) {
> +		dev_err(wdt->wdd.parent, "failed to read the restart reason info\n");
> +		return ret;
> +	}
> +
> +	if (val == data->non_secure_wdt_val)
> +		wdt->wdd.bootstatus = WDIOF_CARDRESET;
> +
> +	return 0;
> +}
> +
>  static int qcom_wdt_probe(struct platform_device *pdev)
>  {
>  	struct device *dev = &pdev->dev;
> @@ -273,8 +304,13 @@ static int qcom_wdt_probe(struct platform_device *pdev)
>  	wdt->wdd.parent = dev;
>  	wdt->layout = data->offset;
>  
> -	if (readl(wdt_addr(wdt, WDT_STS)) & 1)
> -		wdt->wdd.bootstatus = WDIOF_CARDRESET;
> +	ret = qcom_wdt_get_restart_reason(wdt, data);
> +	if (ret == -ENODEV) {
> +		if (readl(wdt_addr(wdt, WDT_STS)) & 1)
> +			wdt->wdd.bootstatus = WDIOF_CARDRESET;
> +	} else if (ret) {
> +		return ret;
> +	}
>  
>  	/*
>  	 * If 'timeout-sec' unspecified in devicetree, assume a 30 second
> 
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry

