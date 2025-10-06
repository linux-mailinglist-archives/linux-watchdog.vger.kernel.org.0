Return-Path: <linux-watchdog+bounces-4326-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DABEBBD97B
	for <lists+linux-watchdog@lfdr.de>; Mon, 06 Oct 2025 12:05:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DB372189689E
	for <lists+linux-watchdog@lfdr.de>; Mon,  6 Oct 2025 10:05:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6223F22D7A5;
	Mon,  6 Oct 2025 10:04:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="drXkFUCo"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8635220694
	for <linux-watchdog@vger.kernel.org>; Mon,  6 Oct 2025 10:04:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759745050; cv=none; b=W+kKbatkfznpc+1l3UljfVPVAgFxU0rm1qEQnIr1MJoFF2X+LlRD9YwWwyOcaKB3s/tZviLsU0dbl7gRN/WBNlA3y7yK0qZ7gnWEmZ3wJtRc4HgeuuU0t/wopOvcI3c3Pb5baBZY8VSItc+575h7I73L+bzXqXRIGwxYMoFQ+oI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759745050; c=relaxed/simple;
	bh=yA3VOCeWJpMeFPPSvsnSB7GRPYFUREqE/fSTw/m8jVo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NM1LVVOvWJiqlXL9NgwEfxdWJ9wWU5SfRLpUVIu3lAo6tjg/R3Ssa+0ORmGtQKaXZypnVGB027GIhIrJQ/UFhjpKMbWn+jXNN6dik9AH+8252cVTwpVgZijjJ+y3nHkDpkmrulmsToExNlyXkrX9MQpFVIWV1bYSy7PFXJOcUTw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=drXkFUCo; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 595NoRBK001391
	for <linux-watchdog@vger.kernel.org>; Mon, 6 Oct 2025 10:04:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=ue1wSy69VigC+Md65Qg2LywO
	1m5qENAP2gsLG1UwtMM=; b=drXkFUCow2VacKOQ4WAGbx/LxgoMHcroSNSFsk9y
	v30uTWmoQjVE4w8Mj8et6SGkM9ozwO8jOlErLGhczGwaHwK8jBg2LU84Kwj4tmCt
	ZpOCvmUObqaZU6UwxneMf91ZUYLG31ts3+IOlUjt36IWeLDK0FmF+R27f66xJku5
	Pdq05yU/roFJcNbFhej6dnMitj10BLHaclknHrurzlHP/TwSLsTNJBuBFijSJJ0X
	gPFMURuMCxjnDHp7eFmOpi+HY5HfkNEFE1n2txJ/6Gy//Ooqni8m7F6T+AIFdB57
	CWL1RTf8x2Tx8JpCSiiwN1tLuNNrx5Xv1y1XZcvBVPS9Tg==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49jtk6um0a-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-watchdog@vger.kernel.org>; Mon, 06 Oct 2025 10:04:07 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-332560b7171so4969129a91.0
        for <linux-watchdog@vger.kernel.org>; Mon, 06 Oct 2025 03:04:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759745046; x=1760349846;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ue1wSy69VigC+Md65Qg2LywO1m5qENAP2gsLG1UwtMM=;
        b=pRdU6GcXGzzEL3cuuFcuMEx1hsOndEE1gevbKDTIrYS1ucgA3id4EBPgFI8gHk3Tf8
         Z4rIOX3IS9hUlz220Pclq5YIPJd1+E5Vt6RdSDS3C3wVofIq14aHVXbHuuDh32ttuKiY
         OjLlbpFD13+h1ypVdbDayFw6m3FuS/0R0575enrZQy1WHZOILNzrnmf6AVfp5WCAFNcO
         dEAgEyql/AUVkUvuLuA5L+xzptkjSpDF0ln8KPSg10uz+0fSs/zPUUpaJ0KJEtUez/3E
         CD3iTyNXtZAfwQqjvao1JRwQET9SXijF95m6Fe3nlIKo54EJHlD8iePjOciD0v+jMbe4
         kz8w==
X-Forwarded-Encrypted: i=1; AJvYcCWfuaB/daUmJOSVKUcvbpoci/crBnnBoXb7mf9t/Z1ZHdhmMV+JS+S2ENPtL1O7xsmmLBkMwvYwIH/lQK5Qhg==@vger.kernel.org
X-Gm-Message-State: AOJu0YxfCPLyyPP4DrOdSM24HZziWGGGdb5Npa3Go9hP4IJd+IOaujqq
	mYdJFT/wSIxYHAMAePtcKeYuiLmMaI0875bK0YZZTjkFNNAtKAZxdz2rWMwaU2TcEIxBt+BJHcX
	dRmIdPcts7BaxIX5WMs/QbR4wIh3IhnNww0ycPLbRNitoOYVKG/t0t0Uqxj0w7VWf1mqMrg==
X-Gm-Gg: ASbGncvnwTGoeG6jUQKswDeMppHKTepNZNMRPO+4XY662CKgatz99xulKB5N+7tgF2i
	WsHyg61tPEz4Uekadi8y8d4t0UrFzxYXP+0zK4HCABfsyUoID19hdvWTIV3f7NXNU834jxD4Kbx
	4lszKnnSxNxUkYPsuZB246t/4ii7aah/EBn7uZUu7VQ0q8WgdL/j4/TEfCzggCEg8S+72mA1kIx
	iMJCBtRSHDsKJ9xc212E8qLVOb9GiOmZKPE/Bc03MLE00+iYr/blf7tTezY7IUCqv1/alP61dtb
	ZPh5XnZzxMpvUDArSpz/kyhtaJJHKqp+Uj2v7hmllRHNuO0hP4hY2ZnAOMSZsRkyXTveX/IIoYE
	M3EQ=
X-Received: by 2002:a17:903:2c0e:b0:27e:f03e:c6b7 with SMTP id d9443c01a7336-28e8d038b9cmr202072285ad.10.1759745046071;
        Mon, 06 Oct 2025 03:04:06 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGXGuzsXDqH+HypDtrXeh1/naCIbPt2MMoelAPp09TjufTVxo08OD/KS48Pkf9lpBlURXi7ww==
X-Received: by 2002:a17:903:2c0e:b0:27e:f03e:c6b7 with SMTP id d9443c01a7336-28e8d038b9cmr202071845ad.10.1759745045504;
        Mon, 06 Oct 2025 03:04:05 -0700 (PDT)
Received: from hu-pkondeti-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-28e8d111931sm127803415ad.17.2025.10.06.03.04.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Oct 2025 03:04:05 -0700 (PDT)
Date: Mon, 6 Oct 2025 15:33:59 +0530
From: Pavan Kondeti <pavan.kondeti@oss.qualcomm.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: hrishabh.rajput@oss.qualcomm.com, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Pavan Kondeti <pavan.kondeti@oss.qualcomm.com>,
        Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v2] watchdog: Add driver for Gunyah Watchdog
Message-ID: <a7633abf-0005-423b-b152-e8c70aa5c27a@quicinc.com>
References: <20251006-gunyah_watchdog-v2-1-b99d41d45450@oss.qualcomm.com>
 <3b901f9d-dbfa-4f93-a8d2-3e89bd9783c9@kernel.org>
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3b901f9d-dbfa-4f93-a8d2-3e89bd9783c9@kernel.org>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDA0MDAxNyBTYWx0ZWRfX+d57tPCN2U1n
 X+77W1ezuh2f46GmwYCo/L9Wxp6NaAWF1dglM9WJvwdwfZGe2Fj8AzvRAGxgT+7QwSU/1GdN0+c
 ur2yea18JTsQ9MjBoQK4cjQBgYtIjFtCtcs7JVBi2wKtUCO6/KRTrJLdxWmQRWmkjI5+VaYWTO+
 TB5ZPNq7vW++VXwcSlVQQ+iXzFZJbQVOI3DEyNj5/DiK+ym5NCbbo5anhO6XpKXtt2tNeZh9oEe
 Ml3oRfZ14zb9MylfLHTUseGVs28L7+h3KNliBPgm8oWXk39wyK+3fAo/ucNM+d4XGnjuIfGQvpL
 7cR7b1CGRGixOFSe7JGhSB26LXrPGMg37JF33OBhzTIXfeUKsfLNjYPkXQoG0QYFpgbTxSA8e/2
 r0PMAZQV29lBdqV3EN1zVlqwi+A1CQ==
X-Authority-Analysis: v=2.4 cv=do3Wylg4 c=1 sm=1 tr=0 ts=68e39417 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=kj9zAlcOel0A:10 a=x6icFKpwvdMA:10 a=VwQbUJbxAAAA:8 a=COk6AnOGAAAA:8
 a=kM1oLTEIhtBy5IrTauIA:9 a=CjuIK1q_8ugA:10 a=rl5im9kqc5Lf4LNbBjHf:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: 0SOxSM4uzfd56MfUwXFWNgI-8WW6d23d
X-Proofpoint-ORIG-GUID: 0SOxSM4uzfd56MfUwXFWNgI-8WW6d23d
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-06_03,2025-10-02_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 lowpriorityscore=0 phishscore=0 clxscore=1015
 malwarescore=0 spamscore=0 impostorscore=0 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2509150000 definitions=main-2510040017

On Mon, Oct 06, 2025 at 05:56:42PM +0900, Krzysztof Kozlowski wrote:
> On 06/10/2025 16:37, Hrishabh Rajput via B4 Relay wrote:
> > +
> > +static int __init gunyah_wdt_init(void)
> > +{
> > +	struct arm_smccc_res res;
> > +	struct watchdog_device *wdd;
> > +	struct device_node *np;
> > +	int ret;
> > +
> > +	np = of_find_compatible_node(NULL, NULL, "qcom,kpss-wdt");
> > +	if (np) {
> > +		of_node_put(np);
> > +		return -ENODEV;
> > +	}
> > +
> > +	np = of_find_compatible_node(NULL, NULL, "arm,sbsa-gwdt");
> > +	if (np) {
> > +		of_node_put(np);
> > +		return -ENODEV;
> > +	}
> > +
> > +	ret = gunyah_wdt_call(GUNYAH_WDT_STATUS, 0, 0, &res);
> > +	if (ret)
> > +		return -ENODEV;
> 
> No, your hypervisor driver (which you have) should start the module via
> adding platform/aux/something devices. Now you are running this on every
> machine, which is clearly wrong...
> 

This is a good point. Thanks for bringing it up. We don't have a
hypervisor glue driver (yet!) that can add an aux device. Based on v1
feedback, we would like to be a standalone module that can self discover
gunyah hypercall interface.

Currently this driver depends on ARCH_QCOM || COMPILE_TEST. So,
technically this can be built and loaded on all non-Qualcomm machines.

We can make the STATUS SMCC before looking for the other watchdog
devices and fail early.

Our Gunyah glue driver [1] do make SMCC call to establish that we
are actually a guest under Gunyah. Since our intention here is to
support watchdog on as many as platform as possible, it is better not to
tie this with glue driver and make it a stand alone and self discovery
module.

If this is not an acceptable solution (Please let us know), we can find other 
ways to limit it to only work on Qualcomm machines. For ex: Socinfo
platform device is added from SMEM driver which make it only probed on 
Qualcomm machines. We can look into this. 

Thanks,
Pavan


[1]
https://lore.kernel.org/all/20240222-gunyah-v17-4-1e9da6763d38@quicinc.com/ 

