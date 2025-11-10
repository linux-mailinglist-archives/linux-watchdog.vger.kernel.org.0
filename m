Return-Path: <linux-watchdog+bounces-4537-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F923C44E62
	for <lists+linux-watchdog@lfdr.de>; Mon, 10 Nov 2025 05:14:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 8855D4E20E1
	for <lists+linux-watchdog@lfdr.de>; Mon, 10 Nov 2025 04:14:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3F073279787;
	Mon, 10 Nov 2025 04:14:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="pmQud2Is";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="brZtqK2t"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFAAE2727EA
	for <linux-watchdog@vger.kernel.org>; Mon, 10 Nov 2025 04:14:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762748043; cv=none; b=gaaT9A4zN2Z66kOtHaLr+U5yO+2DB6dDy6zZU7awqC6oYLlrjIPQBdWCEduMYubh/KGgccsv6r7Y9qRmQefb3wku+IxPGdPifviZtLbjPLXOKyMxWsDxqX7YxJpAbIXmNITq4zkCH9pPpOfVUe7Ae5GoZ31Ld7oKw9oxqp8V94Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762748043; c=relaxed/simple;
	bh=OvMIL+Ag7ao+WlmXilMCYV3oFt3WYL+b4oSFg7J9BrA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RGGNra71jNml4LAULYgQOeiUe1TtkgnbzBXidb7OxqzsxpvZo+ahhc4cJvKwWK1TmBq63ul4GhtvV4/gh/FIiX1JnQROs2kYe1tOmRfnjn7kvZo3NUirIWgs95iszQDotoa4c5vFjh+0xIfSIhilc4H9wyq1YWENy9iRouWXT8E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pmQud2Is; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=brZtqK2t; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AA37W2D2166614
	for <linux-watchdog@vger.kernel.org>; Mon, 10 Nov 2025 04:14:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=63Ba7zBrKoiAWfSOSCfa4uld
	py/JAKEBPUMVKa6S/Es=; b=pmQud2IsyJ6DYawFZ2q2ryuvuOploLX0UuLFG/LW
	ZVeLDF7PypHqPjgpgFTFPG+OLf+0ck9VkRP6bYasoj9oZ60qH/r07cKGMO+OPF5Z
	aw842KDcatU2CaoLRYS29YhnrkzuaWz604Fbr/BBpfpWRRnOjOZsQL7GlHOH32n+
	nAqadAjO5gWqn8Pnplkr3Yx+pZHw18rbyynGESLjejNbB8NhZFg2znuHJyhl+sG6
	I2aCrGrGKwifnNotkvuMkatb1Ss+la/7MAUGo5YvAEwtnr6Il6ObHFkWd3Sdm+NI
	WOJMbNtnnmIZm+L3jWRctqcGVOEJs/RvAsfsIshmsjohIg==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ab7vcr4hn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-watchdog@vger.kernel.org>; Mon, 10 Nov 2025 04:14:00 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-34385d7c4a7so878369a91.0
        for <linux-watchdog@vger.kernel.org>; Sun, 09 Nov 2025 20:14:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1762748040; x=1763352840; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=63Ba7zBrKoiAWfSOSCfa4uldpy/JAKEBPUMVKa6S/Es=;
        b=brZtqK2tI9dnUw4e0B17aEqXjttyzPjoobTe2R+HIm/epkvu9+NZZIseGJIjGrDomA
         qpEIjDPMYDqe/VdO/pOA12XnS7p1LKo4YIDwrwzANxYVDr7UWErZ7p4VAjwLEl/P597V
         rCkUFKfaI2Whn2VCSq2xixBnVpNPrf/efeR4DDCsx8ykWOBRnyt/mE2++3Z2lvgbGd0c
         f68B0BmgR2mV2h87WdZSUdadg8/95jk9KB+LQbm+rQ7hWQ31KuXmPWREyzBDj0U/CARU
         LOhACW/RZt7e/Fwpb11ToZI1A5MRdln8IGTPFeG7Zne8Novpdt0WMQcAEoTzo4aUp7tT
         WFaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762748040; x=1763352840;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=63Ba7zBrKoiAWfSOSCfa4uldpy/JAKEBPUMVKa6S/Es=;
        b=CucGoeQEafEs6NNYHsZB3jHkqsCZrAulAzRUDL2jvJqTHgzyTGuonoRzezh/NkF8t4
         C+2/sI8+xGJArHyTKDWiwG7bjY2kiTxzoTedr+0s5QBPrPv1uSqyKNT7egd0RVJjJvyK
         VtWBRPawE/oR0PCj/O+DXOzXogt0FWzay2VmpEcZI+VobyAtN/I5/xF3dCdna7P8l+9e
         KK3wh6lAJAnnMXsyJXydeqS5nmiwv0h+nwk77i4+KFCRTZ+QUTrq1CE829DeB3a74DpH
         EP0uFjiCVH7gGR8L9a4lK6NbdFShV9esLqoNHS4Q6E6N4pIiKqnxnqLgw6TKPExSTDLU
         5+eQ==
X-Forwarded-Encrypted: i=1; AJvYcCUI1dICam/qfLIfLRIU0NJ3zhsPan66qmpMmRgS2hzpiGa6/OH3RawS6nXiJJmlnaNfHH864zqWNyNhdJS2ZA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxLmdeunXCL1EpadV9CPMVrGmE6ql2ikMe0semxkrohDu8PAntJ
	ACxJdoWM72jTGHrqpiFViwlKdor9sUCwrjqKwS4suZfqtyne/3UBhjYxSIOQ3eEYLfLx1HMw/UV
	1a8vKoqTcE5EkmUGBswZYimGavJp8+dYdr2pGItHcXriMp0bhvZeI0+O0YeG99Z9KQMhUsQ==
X-Gm-Gg: ASbGncs+RLTnGG2stGUv/KxqrDkzlA2U9KLHkfNabI25mzvxRqhkLl5GZEkTkoKc7PG
	Jd008d/IN9WBvoBJG1AhDMkeJBztMJoBVa1uXWas0equQ+E7IZwwyjQkZfznwRJD5O7T0slCxkl
	QjfXLSx3O3sKmlHcOmCb1CUT7DDxnuzKENR8e+VuBaegROp/+x6VI6YmBo144a5vSPV0NdcDkYo
	0WlpYqk5OjCkBPAqYDYL+K1a7g8l3QozSHh8ZjqeJDPLh6096wdRJdm2C/SR/RDYzyjlrUUsQx7
	/Sk9qR/uj5d5dm6/G7dO4x5gt6pAe33bjTKlpxzk/hGRuVAjWEPWbYhTHLg49GQiPoLajbLGBNP
	Bg4p9sgHtiW092dS2yykN6gyJK3ZGNUYP
X-Received: by 2002:a17:90b:3f85:b0:343:6a63:85d5 with SMTP id 98e67ed59e1d1-3436accd340mr8908383a91.16.1762748040213;
        Sun, 09 Nov 2025 20:14:00 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFTZ3wFWABMsdQEIncQiC52zmOKq5UOdMUvgom5QS8xesVHXQPctEzv5PL538yn87n1udFPDQ==
X-Received: by 2002:a17:90b:3f85:b0:343:6a63:85d5 with SMTP id 98e67ed59e1d1-3436accd340mr8908348a91.16.1762748039722;
        Sun, 09 Nov 2025 20:13:59 -0800 (PST)
Received: from hu-pkondeti-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7b0c9635007sm10178757b3a.2.2025.11.09.20.13.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 Nov 2025 20:13:59 -0800 (PST)
Date: Mon, 10 Nov 2025 09:43:53 +0530
From: Pavan Kondeti <pavan.kondeti@oss.qualcomm.com>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
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
Subject: Re: [PATCH v5 1/2] firmware: qcom: scm: Register gunyah watchdog
 device
Message-ID: <263d1390-eff5-4846-b2c2-31f96fc3248e@quicinc.com>
References: <20251107-gunyah_watchdog-v5-0-4c6e3fb6eb17@oss.qualcomm.com>
 <20251107-gunyah_watchdog-v5-1-4c6e3fb6eb17@oss.qualcomm.com>
 <hbxtbaoavlsw7pbmg3cfkbyx4nacjfiikckhqgpvlggbh6hu5b@jyporqecfzni>
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <hbxtbaoavlsw7pbmg3cfkbyx4nacjfiikckhqgpvlggbh6hu5b@jyporqecfzni>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTEwMDAzMyBTYWx0ZWRfX8JDbqVLWeQE8
 EeyOQwTnIbx9cOWn4mQf0Y/YDllbM7O5vxyAuk76FgyYBhtMKJebN5N80rovOidOsVEMw8YW53I
 bgShFqlPDjERYrQm0Yk0bNBNrmXZeNIULRn9hgcLGh8Epxqk+iWZfi51MH1oIJze12GQHSIz2UK
 gwHtaZNby0+g0JwFbDVQULr09pJC0jGJiIAbkV95JjbStS5PTVMxXSaxdMgTG6aNmhxVvbdulLg
 IT/ojV2dXA96RJgIB8AwIitOEmCWG+5wl6bS/qv8L/0r+I3GHOPmV4bnEUuAdEC4XErnM36fkYb
 BFmpBdFk1QmLXsIBo6eq7N2EN4H/shhxON7DDCxNk/qXvZt1yv1LsvJHI2Y+SqpXreXJodsLZ+X
 pfPq9iNYbiKKvxnIFHh+X9uRfEZwGA==
X-Proofpoint-GUID: R60TP7vBFeOwZqSbo6k0Tuzy2wLOF7LH
X-Authority-Analysis: v=2.4 cv=E8HAZKdl c=1 sm=1 tr=0 ts=69116688 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=kj9zAlcOel0A:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=5liKcR6gdwzQ9ZU9jv4A:9
 a=NqO74GWdXPXpGKcKHaDJD/ajO6k=:19 a=CjuIK1q_8ugA:10 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-ORIG-GUID: R60TP7vBFeOwZqSbo6k0Tuzy2wLOF7LH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-10_01,2025-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 impostorscore=0 malwarescore=0 adultscore=0
 bulkscore=0 clxscore=1015 spamscore=0 suspectscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511100033

On Sat, Nov 08, 2025 at 07:26:46PM +0200, Dmitry Baryshkov wrote:
> > +static void qcom_scm_gunyah_wdt_free(void *data)
> > +{
> > +	struct platform_device *gunyah_wdt_dev = data;
> > +
> > +	platform_device_unregister(gunyah_wdt_dev);
> > +}
> > +
> > +static void qcom_scm_gunyah_wdt_init(struct qcom_scm *scm)
> > +{
> > +	struct platform_device *gunyah_wdt_dev;
> > +	struct device_node *np;
> > +	bool of_wdt_available;
> > +	int i;
> > +	uuid_t gunyah_uuid = UUID_INIT(0xc1d58fcd, 0xa453, 0x5fdb, 0x92, 0x65,
> 
> static const?
> 
> > +				       0xce, 0x36, 0x67, 0x3d, 0x5f, 0x14);
> > +	static const char * const of_wdt_compatible[] = {
> > +		"qcom,kpss-wdt",
> > +		"arm,sbsa-gwdt",
> > +	};
> > +
> > +	/* Bail out if we are not running under Gunyah */
> > +	if (!arm_smccc_hypervisor_has_uuid(&gunyah_uuid))
> > +		return;
> 
> This rquires 'select HAVE_ARM_SMCCC_DISCOVERY'
> 

Probably `depends on HAVE_ARM_SMCCC_DISCOVERY` is correct here.

Thanks,
Pavan

