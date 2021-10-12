Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DC65E42A38F
	for <lists+linux-watchdog@lfdr.de>; Tue, 12 Oct 2021 13:45:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236158AbhJLLrS (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Tue, 12 Oct 2021 07:47:18 -0400
Received: from mail-eopbgr70058.outbound.protection.outlook.com ([40.107.7.58]:11598
        "EHLO EUR04-HE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S232665AbhJLLrR (ORCPT <rfc822;linux-watchdog@vger.kernel.org>);
        Tue, 12 Oct 2021 07:47:17 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TgGAlFw70dZ4aK+QGBIIBHG5+w2jVf80lotPFfEydKxXQ3cxr6bTc556yRCDh88sHT/5P0GQ9zRBET/zjmJbWWMy6TyVDkGWvWyhzb+YBLr6tjpVcR+zJsuUbKRFzK4B8/EBNDifEub7Uh1sZ2iqTUAHPfSx1VBdkbB2VwmAtbI2jXdxyMnV5VN1hrkh11zEQIghaa9oo73Rq0ObTbGc8K+KYc/l2x60KyhjOzoObFby2d6pn+PPJgXNnFjhXcpcyOSpVVYvBOxIBMkMtRbouAUgngFqLyOkd+7BiNzyBu5ZS8tQA4Q7gB372Y8We8SyFU8r3yZnvqVhA+sw+UzSdw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JIEwYmPDogr2xK7nMSpAZbIPTGT8DTXbnVWALZywgbs=;
 b=Nm9pbOAo8v5cmwAHZihzvs6MbFqp017jWVbsfouQnDYYxfyZXNL191ppSKOQDb3W+PaL5V0RBH+FTSB3sjHFupW+RbrbV8kubY0ZpJU/dfZWDHFtdPx4921Fs5YkP2YTJowDDOWg0Eu36LcQ/KlBiMC5mj9vErsnWtPme+mb+vxX1/4VW8/MJaqSgu84IE6oqOSOgK2KrhXGRwaZn8BtHMH/kc8eiwgR3M/kP3IuQ0k4JSn2bP7V3oW3bRpXIsRdnAUIDv6VwVDFoP948IgsBXc8EBt7El73esQnLiVBYdAC20ixcxnnA8YSEdCWsmAxYhfqzFgzXugGf+QJqHs4Hg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=asem.it; dmarc=pass action=none header.from=asem.it; dkim=pass
 header.d=asem.it; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=asem.it; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JIEwYmPDogr2xK7nMSpAZbIPTGT8DTXbnVWALZywgbs=;
 b=W0+xfj/yLBkSZUfsl9IvpHYaOMKxjjymtoiLWJ603Y1DCl6mz19vmcTSlNlzCeKjGc/Maz02oe1EGcJdVIFlWazE4GmRSbJt5ksBFUG/LQMkEFA1Xqu60fNZ8vl69phMAGvrd6aBQGm3i2Zg9CNgZvDR8Pnvno9rNwM667At3SY=
Received: from DU2PR01MB8144.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:27a::19) by DU2PR01MB8861.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:2fd::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4587.20; Tue, 12 Oct
 2021 11:45:10 +0000
Received: from DU2PR01MB8144.eurprd01.prod.exchangelabs.com
 ([fe80::f9ae:d9f5:ca8f:8ab2]) by DU2PR01MB8144.eurprd01.prod.exchangelabs.com
 ([fe80::f9ae:d9f5:ca8f:8ab2%9]) with mapi id 15.20.4587.026; Tue, 12 Oct 2021
 11:45:09 +0000
From:   Flavio Suligoi <f.suligoi@asem.it>
To:     Guenter Roeck <linux@roeck-us.net>
CC:     Wim Van Sebroeck <wim@linux-watchdog.org>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        "linux-watchdog@vger.kernel.org" <linux-watchdog@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: RE: [PATCH v4] watchdog: add new parameter to start the watchdog on
 module insertion
Thread-Topic: [PATCH v4] watchdog: add new parameter to start the watchdog on
 module insertion
Thread-Index: AQHXsUkBjeJr4Ci6pE2s2DLc2IqzPavNG1SAgAI9qpA=
Date:   Tue, 12 Oct 2021 11:45:09 +0000
Message-ID: <DU2PR01MB8144D4958B14C0D7D19F5EE0F9B69@DU2PR01MB8144.eurprd01.prod.exchangelabs.com>
References: <20210924133509.3454834-1-f.suligoi@asem.it>
 <20211011012601.GA3296185@roeck-us.net>
In-Reply-To: <20211011012601.GA3296185@roeck-us.net>
Accept-Language: it-IT, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: roeck-us.net; dkim=none (message not signed)
 header.d=none;roeck-us.net; dmarc=none action=none header.from=asem.it;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 3345b024-9f46-4e6f-0bec-08d98d75be5a
x-ms-traffictypediagnostic: DU2PR01MB8861:
x-microsoft-antispam-prvs: <DU2PR01MB88616B52D5F23E7BA30BED0DF9B69@DU2PR01MB8861.eurprd01.prod.exchangelabs.com>
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Q6XB04KCqEuheOTFq9DxcMZ7bbeRrkGKjCfCKLcOP18ML58xVMZNmVDCBTKgnb1zpK5jhDg1LTv+XpIQpNuxs1u9rlFNJA1KvHYz9uY04O9xyIMakXQXB7WamtC+7Q3K82OBflE4Gp3gd0H7TKu1+MrDdBoH4P/j++2AcwkXd1mDQAaDhWV8PoAcG1zoMUJHHnNXt1mhuM41w9hjdy11KScQdomEsyXeuOhb5Q1Qh9dABZRDrjvXt131qcPE6ItzSH8p0QikgWw85KKHL2gBjbDdClnBqcaJNBzTrLWTIhwTT6IOC+hqeLtt5xWHWPBB4o1yu7dYPmzWMWRPa/PTDVWw7nNXn1TvwQYt5y2K0N6pGzbNKhfmbhOqb/doXu8v22YYP8VQ8Rfq4yUdQxeK1iQo2eyBFiyBDKzzYndEsP5EbkgwOoEYLWyyGokiLSGsVaenYzmgLUrzrzCKZ1ZrJjNubYXYTLTSiqVTw4PFURNcqcrWUwXyb94y4RxEw/JxAiVdQ/L1agOiEErRK4og/82T/UsPrX9+1J12Xz9rcvbQAEENEhB36nC5aK6aXbAagJo6QQQKxMBJd7cNEIqRV/KuLr4+72tKLU5b4fRQmvPQIsfpTVJsjaYRLyWPKQAgfhrv656lcql+dt+Sj9uBcB8dUy1m8ghWDWMVa+J19ZJNaSUzxC/9gD81fzwf99L4bkdGP8N7XdmGh9TRG+8GOA==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR01MB8144.eurprd01.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(366004)(4326008)(9686003)(122000001)(38100700002)(33656002)(26005)(54906003)(38070700005)(8676002)(83380400001)(55016002)(6916009)(7696005)(66946007)(53546011)(52536014)(66446008)(86362001)(66476007)(5660300002)(71200400001)(66556008)(8936002)(316002)(64756008)(508600001)(2906002)(6506007)(76116006)(186003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?K42I0HPURrEbMKmWNNyhV3ETzPGfcyg7jvOEmsE5T+Z2rdUOjbFxSztlEB?=
 =?iso-8859-1?Q?vNb/gFNa0byfVk8gIV+UixY2v2yt3xD+aG4hgyvGOoVbsbbAMFLOgfzyXi?=
 =?iso-8859-1?Q?YAnUisKaVcBFda9/f6T4XMV1kC7fyxRvZaSnLOyH9tp9BRG0/UJnRE8+zy?=
 =?iso-8859-1?Q?wlYFrmn+sWVe5EE5UEhap1Szs3qmf7JNx2iIbaNBdOjl9WjrG+1/ueEhT5?=
 =?iso-8859-1?Q?7Jo8iVB0elaQU9ZuYKwyvxBZ2AwbpB1I/ZcftKCDT67uScl10zeWIc5C+C?=
 =?iso-8859-1?Q?cdjXiuz1YkMeBt9veR0y3VRpNLtCpKkLfAQ6XBEH9Q/edrLyHZD9ss8Qlk?=
 =?iso-8859-1?Q?vQheDIp4hEHNrpZR0xhWQTtJXiLes/uniyO/yrk1u/sCNRUt08P1u8NIKI?=
 =?iso-8859-1?Q?s+tCXU7ue0WI8xYVfUtoEpYPjYlEh4ZehJF6WcwZhLXJAXQnfL20KZgPHS?=
 =?iso-8859-1?Q?KjUO0s6xxrWSyB2EwLXJYQn03T+Urbkgow0Sxq1HgobZJsih7lFR3sDMqd?=
 =?iso-8859-1?Q?ndxOQEzEle3vOOJlVP5w8EX9hk+sNXPuh1UPncpUdfIXpiTCLRMn4l+eYJ?=
 =?iso-8859-1?Q?T00v/Hoba9Kas9eSg09cyFth6Ldz+D6KgxUQmp95X0NngywCbClI3av7JQ?=
 =?iso-8859-1?Q?gFHG8Syi9i3wN8XV2zILiDudXmenMq9AJmYfF/xMpmLyNygZ8K21lOYJ+2?=
 =?iso-8859-1?Q?gbHlIxTUjQm+bvONacS9u6+wWi33NGBt8hXz+KIRRiwJVZmoHI9tjsII/s?=
 =?iso-8859-1?Q?cdFpbUzdp1w2OPfS49+4Cu8f2nuOp1GWtwQXnORELklNx1sHEFljqdBfvM?=
 =?iso-8859-1?Q?J1YLTFo/nGoZB8cv3s/Pvcsj5+serN/V3LQBBAMnXm0/EXn/nHyR9XwDxo?=
 =?iso-8859-1?Q?DWrYzIZs7xy/xmtLskFrT3gRz+A/G6ES+pF5lWJSi1IoUqfvQmxOIZ7fdJ?=
 =?iso-8859-1?Q?Yv5Hbz1alSiwIjAipkznwfbUnMM/HJ0eRD+u5m+aqhV9komxBZdwgChxNY?=
 =?iso-8859-1?Q?DN5seo0tWkh3xGBXJrRP6GPEefc0JBV+0kcHrqMLQXtETpGMG+BxEGDW6L?=
 =?iso-8859-1?Q?bfVvb6k5s/uyn0Giqv7T+p+fe2+r+8U7vZsrLevvkARCrfRqHMQrVTqw4V?=
 =?iso-8859-1?Q?4SNBqBOZB1/aSV1QSNhDSH+93KpsBWYokZgtfD5Vw4fwx00GUntCVCItcY?=
 =?iso-8859-1?Q?mzCoomekV9tShknAMulFuPJbtlIZZvmtTB854bYj4ua6ZpTuYMkcNnupmr?=
 =?iso-8859-1?Q?nvpCpXWgTh8sRloZM8/Vkre39/ecwPPxTb6FQhY5ZIBdh7H1db0heLLh8U?=
 =?iso-8859-1?Q?Hdxdqybyvg+1sSlXHXou0TALx/E3lqUsZ8nA6rBwNehznsE=3D?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: asem.it
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DU2PR01MB8144.eurprd01.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3345b024-9f46-4e6f-0bec-08d98d75be5a
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Oct 2021 11:45:09.2922
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: d0a766c6-7992-4344-a4a2-a467a7bb1ed2
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: FCOBEyVIAWzLHLq+KI6yRKgWHlUuBIvSwXCqETNEMAZrGHBq7A5Z5yxaHgO4NbNg7/ve+d0A3oNehSkzHZwjrQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR01MB8861
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

Hi Guenter,

> -----Original Message-----
> From: Guenter Roeck <groeck7@gmail.com> On Behalf Of Guenter Roeck
> Sent: luned=EC 11 ottobre 2021 03:26
> To: Flavio Suligoi <f.suligoi@asem.it>
> Cc: Wim Van Sebroeck <wim@linux-watchdog.org>; Mika Westerberg
> <mika.westerberg@linux.intel.com>; linux-watchdog@vger.kernel.org; linux-
> kernel@vger.kernel.org
> Subject: Re: [PATCH v4] watchdog: add new parameter to start the watchdog
> on module insertion
>=20
> On Fri, Sep 24, 2021 at 03:35:09PM +0200, Flavio Suligoi wrote:
> > The new parameter "start_enabled" starts the watchdog at the same time
> > of the module insertion.

...

> > diff --git a/drivers/watchdog/watchdog_core.c
> b/drivers/watchdog/watchdog_core.c
> > index 3fe8a7edc252..d9211fea45d7 100644
> > --- a/drivers/watchdog/watchdog_core.c
> > +++ b/drivers/watchdog/watchdog_core.c
> > @@ -44,6 +44,11 @@ static int stop_on_reboot =3D -1;
> >  module_param(stop_on_reboot, int, 0444);
> >  MODULE_PARM_DESC(stop_on_reboot, "Stop watchdogs on reboot (0=3Dkeep
> watching, 1=3Dstop)");
> >
> > +static bool start_enabled =3D
> IS_ENABLED(CONFIG_WATCHDOG_START_ENABLED);
> > +module_param(start_enabled, bool, 0444);
> > +MODULE_PARM_DESC(start_enabled, "Start watchdog on module insertion
> (default=3D"
> > +
> 	__MODULE_STRING(IS_ENABLED(CONFIG_WATCHDOG_START_ENABL
> ED)) ")");
> > +
> >  /*
> >   * Deferred Registration infrastructure.
> >   *
> > @@ -252,6 +257,15 @@ static int __watchdog_register_device(struct
> watchdog_device *wdd)
> >  	 * corrupted in a later stage then we expect a kernel panic!
> >  	 */
> >
> > +	/* If required, start the watchdog immediately */
> > +	if (start_enabled && !watchdog_hw_running(wdd)) {
> > +		set_bit(WDOG_HW_RUNNING, &wdd->status);
> > +		ret =3D wdd->ops->start(wdd);
> > +		if (ret)
> > +			return ret;
> > +		pr_info("Watchdog enabled\n");
> > +	}
> > +
> I am not convinced that this is the best location to start the watchdog.
> Maybe that should be done in watchdog_cdev_register().

Ok, thanks, I'll also explore this way

>=20
> >  	/* Use alias for watchdog id if possible */
> >  	if (wdd->parent) {
> >  		ret =3D of_alias_get_id(wdd->parent->of_node, "watchdog");
> > @@ -356,6 +370,9 @@ int watchdog_register_device(struct
> watchdog_device *wdd)
> >  	mutex_unlock(&wtd_deferred_reg_mutex);
> >
> >  	if (ret) {
> > +		if (start_enabled && watchdog_hw_running(wdd) &&
> > +		    wdd->ops->stop)
> > +			wdd->ops->stop(wdd);
>=20
> This code stops the watchdog if watchdog registration failed even and
> especially if it was already running when the module was inserted.
> This changes semantics and is thus not aceptable.

Ok, right, I'll found a different solution.

>=20
> >  		dev_str =3D wdd->parent ? dev_name(wdd->parent) :
> >  			  (const char *)wdd->info->identity;
> >  		pr_err("%s: failed to register watchdog device (err =3D %d)\n",

Thanks Guenter,

Flavio
