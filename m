Return-Path: <linux-watchdog+bounces-1095-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C49B28FACAD
	for <lists+linux-watchdog@lfdr.de>; Tue,  4 Jun 2024 09:56:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E70F51C20C46
	for <lists+linux-watchdog@lfdr.de>; Tue,  4 Jun 2024 07:56:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 668A21422A3;
	Tue,  4 Jun 2024 07:55:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LcsYFcLq"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52CEE1419A0;
	Tue,  4 Jun 2024 07:55:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717487754; cv=none; b=lueVmT8TBtMrax/YI0KAK0aqoy7uxLWiSQIFpTa40yyBqrZ04KPXLRwzNs2SgF1zWMBES5BesFMtE/9pRLEGl2RlnZwsghS5xfViwndWxfTm3aJ8nQYSJaBclBwGB96S3z1/K4M6R3xWhdEH/rRSxh1ikoh/yNKJulWVRrVIpX0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717487754; c=relaxed/simple;
	bh=C5o5SBN8uXgKhyh/zkbsNvoU/ikohgWwgjdQR5iPB4o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ERH3KYtdbaM1FVJh5ALnQB7fqzA2UP639lIYAPIZPyb20zCFT9pCJVEYvnw3O66wF1TPFeYy4wu/rUibuHR4dyRfTJnzx0GH/2jdqiXMF9dvAdEYJ+z2HXSKTu3AYojLfbfSgePHWTefNEf6W27QaB9uMrlePEFn0q6FDtO5Cjk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LcsYFcLq; arc=none smtp.client-ip=209.85.167.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-52b962c4bb6so3333822e87.3;
        Tue, 04 Jun 2024 00:55:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1717487750; x=1718092550; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=4JduBG3L5CKqrZRQ+K3JTNgyGjUZ6PHYmMbEbdzsGj8=;
        b=LcsYFcLqAJZMdOuHNcWIPT/INUdBD0oh1rvl9JqpTiofq50iTRsa/Pe6QoC2m8Cfzn
         gGPOso6sxhfdU/LSY3hzyPwi9Q4H0WsaXxnG4yzud0S1FrgkI38zQQjli394gw2aYoaJ
         0QZ3RglvM9lA535/N42S9zKAwzT3fOWwQoyz78xjgyyQ7jbqUSqtZGGwRaJHnpt9kLFJ
         cc6HDySPD0VoBfx6XArVLGocd1+8FbRVXYdSjKkLM0b5gFQ9tMciOoqMUXfS1OgeONq4
         pVdEdr/hqX5xzfWZmCl0aaHkpVm7ET943yR/wxeIAdp5hOGsJzgyszInPEcYiJR/xSse
         stlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717487750; x=1718092550;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4JduBG3L5CKqrZRQ+K3JTNgyGjUZ6PHYmMbEbdzsGj8=;
        b=gLgQQ9vx5UKkI/Ozj1CoYpO72LWATThcFuK+d9YVFRIGRk5jVAbZ1h5RF63I9EyDJ4
         xDTRXfc9Hl/mOluZ9uEaMgcA1R0plv1c1F/cscIwgyOHDtRrWpDB7PNLBQGzuq9wz4DO
         XWg5ZtesC7rcQbgmBTkd11bG2KNzdMU007tb3qNQj90UmnBxFS31Uze4/61qPETiP1ny
         VAtJX4d0t+52avK2gxUkI/wyWKN4Na3V0r1Xd5wyG0KG/OCyOeE/rR8bm6D88xy8cOZb
         oMZFQC6LyKGM105vq7S+1Hw11vVxEez6NvH/p2uknlVNXqB/C6DM8lbXSH2z+SRF2HtA
         zobw==
X-Forwarded-Encrypted: i=1; AJvYcCUjlRis7xOM99ZY+/IJ/0/p9Y1+cv4t0NkOtZ6BrV7ylswczxIz5jtB6Ehw3Rr1rsaOHlaO+lkkv/4LP8qxBPyeaYdzjJoiPanlZFtD1FLNB8yFqBzrB4jftAY8SJCA1VytVPUTn9+Mn6FbCItXjwrE5XqZRAn17SZnRlYuD/bkbnqFT275KzqA
X-Gm-Message-State: AOJu0Yzq52P5t+FaWRapZdHSiJmYyhfFaR7jOTT+u3+nBlr0HfH2jxpE
	kTGoXdCptP0GMvbenFAlE4keZsiKZm/bbnHtWct4q4RpirnctN7z
X-Google-Smtp-Source: AGHT+IEv0NwZnn8rdvjSaxjfYlbFRiLMXClL8ErhUqzyDiMvoCACa459pZ0gciIz4YrrnUlSeDvp2A==
X-Received: by 2002:a05:6512:2391:b0:52b:8aa1:bdca with SMTP id 2adb3069b0e04-52b8aa1be8emr11296775e87.49.1717487750229;
        Tue, 04 Jun 2024 00:55:50 -0700 (PDT)
Received: from fedora ([213.255.186.46])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-52b97984553sm689274e87.19.2024.06.04.00.55.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Jun 2024 00:55:49 -0700 (PDT)
Date: Tue, 4 Jun 2024 10:55:45 +0300
From: Matti Vaittinen <mazziesaccount@gmail.com>
To: Matti Vaittinen <mazziesaccount@gmail.com>,
	Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
Cc: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Matti Vaittinen <mazziesaccount@gmail.com>,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	Guenter Roeck <linux@roeck-us.net>,
	Thomas Gleixner <tglx@linutronix.de>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-watchdog@vger.kernel.org
Subject: [PATCH v3 07/10] irqdomain: Allow giving name suffix for domain
Message-ID: <bbd219c95f4fe88752aee5f21232480fe9b949fb.1717486682.git.mazziesaccount@gmail.com>
References: <cover.1717486682.git.mazziesaccount@gmail.com>
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="abMiHA/nfhBxl0Pc"
Content-Disposition: inline
In-Reply-To: <cover.1717486682.git.mazziesaccount@gmail.com>


--abMiHA/nfhBxl0Pc
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Devices can provide multiple interrupt lines. One reason for this is that
a device has multiple subfunctions, each providing its own interrupt line.
Another reason is that a device can be designed to be used (also) on a
system where some of the interrupts can be routed to another processor.

A line often further acts as a demultiplex for specific interrupts
and has it's respective set of interrupt (status, mask, ack, ...)
registers.

Regmap supports the handling of these registers and demultiplexing
interrupts, but interrupt domain code ends up assigning the same name for
the per interrupt line domains. This will cause a naming collision in the
debugFS code and can also lead to confusion, as /proc/interrupts would
show two separate interrupts with the same domain name and hardware
interrupt number.

Instead of adding a workaround in regmap or driver code, allow giving a
name suffix for the domain name when the domain is created.

Add support for name suffix in __irq_domain_add() and allow using it via
new irq_domain_create_linear_named() function. This is the only function
required by the regmap code to support such setups because no new
drivers are expected to be using legacy domains.

Signed-off-by: Matti Vaittinen <mazziesaccount@gmail.com>

---
Revision history:
v2 =3D> v3:
 - Improve the commit message
 - Drop the new name-suffix API for legacy domains

Some devices which could use this are ROHM's BD96801, BD96802 and BD96811
PMICs. BD96801 is being upstreamed, others are on my TODO list - but I
believe this may be beneficial to any other devices as well. Especially
for those which provide IRQs that are clearly different from each
other.

Some discussion about this can be found from:
https://lore.kernel.org/all/Zjzt8mOW6dO_7XNV@finisterre.sirena.org.uk/
---
 include/linux/irqdomain.h | 22 ++++++++++++++++------
 kernel/irq/irqdomain.c    | 37 +++++++++++++++++++++++++++++--------
 2 files changed, 45 insertions(+), 14 deletions(-)

diff --git a/include/linux/irqdomain.h b/include/linux/irqdomain.h
index 21ecf582a0fe..0d829495bf9e 100644
--- a/include/linux/irqdomain.h
+++ b/include/linux/irqdomain.h
@@ -260,7 +260,7 @@ void irq_domain_free_fwnode(struct fwnode_handle *fwnod=
e);
 struct irq_domain *__irq_domain_add(struct fwnode_handle *fwnode, unsigned=
 int size,
 				    irq_hw_number_t hwirq_max, int direct_max,
 				    const struct irq_domain_ops *ops,
-				    void *host_data);
+				    void *host_data, const char *name_suffix);
 struct irq_domain *irq_domain_create_simple(struct fwnode_handle *fwnode,
 					    unsigned int size,
 					    unsigned int first_irq,
@@ -350,7 +350,8 @@ static inline struct irq_domain *irq_domain_add_linear(=
struct device_node *of_no
 					 const struct irq_domain_ops *ops,
 					 void *host_data)
 {
-	return __irq_domain_add(of_node_to_fwnode(of_node), size, size, 0, ops, h=
ost_data);
+	return __irq_domain_add(of_node_to_fwnode(of_node), size, size, 0, ops,
+				host_data, NULL);
 }
=20
 #ifdef CONFIG_IRQ_DOMAIN_NOMAP
@@ -359,7 +360,8 @@ static inline struct irq_domain *irq_domain_add_nomap(s=
truct device_node *of_nod
 					 const struct irq_domain_ops *ops,
 					 void *host_data)
 {
-	return __irq_domain_add(of_node_to_fwnode(of_node), 0, max_irq, max_irq, =
ops, host_data);
+	return __irq_domain_add(of_node_to_fwnode(of_node), 0, max_irq, max_irq,
+						  ops, host_data, NULL);
 }
=20
 extern unsigned int irq_create_direct_mapping(struct irq_domain *host);
@@ -369,7 +371,7 @@ static inline struct irq_domain *irq_domain_add_tree(st=
ruct device_node *of_node
 					 const struct irq_domain_ops *ops,
 					 void *host_data)
 {
-	return __irq_domain_add(of_node_to_fwnode(of_node), 0, ~0, 0, ops, host_d=
ata);
+	return __irq_domain_add(of_node_to_fwnode(of_node), 0, ~0, 0, ops, host_d=
ata, NULL);
 }
=20
 static inline struct irq_domain *irq_domain_create_linear(struct fwnode_ha=
ndle *fwnode,
@@ -377,14 +379,22 @@ static inline struct irq_domain *irq_domain_create_li=
near(struct fwnode_handle *
 					 const struct irq_domain_ops *ops,
 					 void *host_data)
 {
-	return __irq_domain_add(fwnode, size, size, 0, ops, host_data);
+	return __irq_domain_add(fwnode, size, size, 0, ops, host_data, NULL);
+}
+
+static inline struct irq_domain *irq_domain_create_linear_named(struct fwn=
ode_handle *fwnode,
+					 unsigned int size,
+					 const struct irq_domain_ops *ops,
+					 void *host_data, const char *name_suffix)
+{
+	return __irq_domain_add(fwnode, size, size, 0, ops, host_data, name_suffi=
x);
 }
=20
 static inline struct irq_domain *irq_domain_create_tree(struct fwnode_hand=
le *fwnode,
 					 const struct irq_domain_ops *ops,
 					 void *host_data)
 {
-	return __irq_domain_add(fwnode, 0, ~0, 0, ops, host_data);
+	return __irq_domain_add(fwnode, 0, ~0, 0, ops, host_data, NULL);
 }
=20
 extern void irq_domain_remove(struct irq_domain *host);
diff --git a/kernel/irq/irqdomain.c b/kernel/irq/irqdomain.c
index aadc8891cc16..c2a565aeada8 100644
--- a/kernel/irq/irqdomain.c
+++ b/kernel/irq/irqdomain.c
@@ -132,7 +132,8 @@ static struct irq_domain *__irq_domain_create(struct fw=
node_handle *fwnode,
 					      irq_hw_number_t hwirq_max,
 					      int direct_max,
 					      const struct irq_domain_ops *ops,
-					      void *host_data)
+					      void *host_data,
+					      const char *name_suffix)
 {
 	struct irqchip_fwid *fwid;
 	struct irq_domain *domain;
@@ -150,6 +151,17 @@ static struct irq_domain *__irq_domain_create(struct f=
wnode_handle *fwnode,
 		return NULL;
=20
 	if (is_fwnode_irqchip(fwnode)) {
+		/*
+		 * The name_suffix is only intended to be used to avoid a name
+		 * collison, when multiple domains are created for a single
+		 * device and the name is picked using a real device node.
+		 * (Typical use-case is regmap-IRQ controllers for devices
+		 * providing more than one physical IRQ.) There should be no
+		 * need to use name_suffix with irqchip-fwnode.
+		 */
+		if (name_suffix)
+			return NULL;
+
 		fwid =3D container_of(fwnode, struct irqchip_fwid, fwnode);
=20
 		switch (fwid->type) {
@@ -177,7 +189,11 @@ static struct irq_domain *__irq_domain_create(struct f=
wnode_handle *fwnode,
 		 * unhappy about. Replace them with ':', which does
 		 * the trick and is not as offensive as '\'...
 		 */
-		name =3D kasprintf(GFP_KERNEL, "%pfw", fwnode);
+		if (!name_suffix)
+			name =3D kasprintf(GFP_KERNEL, "%pfw", fwnode);
+		else
+			name =3D kasprintf(GFP_KERNEL, "%pfw-%s", fwnode,
+					 name_suffix);
 		if (!name) {
 			kfree(domain);
 			return NULL;
@@ -249,6 +265,8 @@ static void __irq_domain_publish(struct irq_domain *dom=
ain)
  *              direct mapping
  * @ops: domain callbacks
  * @host_data: Controller private data pointer
+ * @name_suffix: Optional name suffix to avoid collisions when multiple do=
mains
+ *		 are added using same fwnode
  *
  * Allocates and initializes an irq_domain structure.
  * Returns pointer to IRQ domain, or NULL on failure.
@@ -256,12 +274,12 @@ static void __irq_domain_publish(struct irq_domain *d=
omain)
 struct irq_domain *__irq_domain_add(struct fwnode_handle *fwnode, unsigned=
 int size,
 				    irq_hw_number_t hwirq_max, int direct_max,
 				    const struct irq_domain_ops *ops,
-				    void *host_data)
+				    void *host_data, const char *name_suffix)
 {
 	struct irq_domain *domain;
=20
 	domain =3D __irq_domain_create(fwnode, size, hwirq_max, direct_max,
-				     ops, host_data);
+				     ops, host_data, name_suffix);
 	if (domain)
 		__irq_domain_publish(domain);
=20
@@ -362,7 +380,7 @@ struct irq_domain *irq_domain_create_simple(struct fwno=
de_handle *fwnode,
 {
 	struct irq_domain *domain;
=20
-	domain =3D __irq_domain_add(fwnode, size, size, 0, ops, host_data);
+	domain =3D __irq_domain_add(fwnode, size, size, 0, ops, host_data, NULL);
 	if (!domain)
 		return NULL;
=20
@@ -418,7 +436,8 @@ struct irq_domain *irq_domain_create_legacy(struct fwno=
de_handle *fwnode,
 {
 	struct irq_domain *domain;
=20
-	domain =3D __irq_domain_add(fwnode, first_hwirq + size, first_hwirq + siz=
e, 0, ops, host_data);
+	domain =3D __irq_domain_add(fwnode, first_hwirq + size, first_hwirq + siz=
e,
+				  0, ops, host_data, NULL);
 	if (domain)
 		irq_domain_associate_many(domain, first_irq, first_hwirq, size);
=20
@@ -1147,9 +1166,11 @@ struct irq_domain *irq_domain_create_hierarchy(struc=
t irq_domain *parent,
 	struct irq_domain *domain;
=20
 	if (size)
-		domain =3D __irq_domain_create(fwnode, size, size, 0, ops, host_data);
+		domain =3D __irq_domain_create(fwnode, size, size, 0, ops,
+					     host_data, NULL);
 	else
-		domain =3D __irq_domain_create(fwnode, 0, ~0, 0, ops, host_data);
+		domain =3D __irq_domain_create(fwnode, 0, ~0, 0, ops, host_data,
+					     NULL);
=20
 	if (domain) {
 		if (parent)
--=20
2.45.1


--=20
Matti Vaittinen, Linux device drivers
ROHM Semiconductors, Finland SWDC
Kiviharjunlenkki 1E
90220 OULU
FINLAND

~~~ "I don't think so," said Rene Descartes. Just then he vanished ~~~
Simon says - in Latin please.
~~~ "non cogito me" dixit Rene Descarte, deinde evanescavit ~~~
Thanks to Simon Glass for the translation =3D]=20

--abMiHA/nfhBxl0Pc
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEIx+f8wZb28fLKEhTeFA3/03aocUFAmZeyIEACgkQeFA3/03a
ocXAJwf+O3F71C+jhELo9wBayxkL2YIWBM6bCtmJ6tCB3aJtdJiMwedtSMpWBW62
TlmtFLAB3/0yDfJh/h8S8WNWH6iPNo3z2L6qm99XUujM/QlbzVE5syFIK6c5YdnE
Gll+LVckvC20U2i7UvZm5UaPKV1H8a4qrSk2ESjFkGoHN+CX6+LW/7BWCXCfTTBL
KPUM4Q+BXWVIDV67eq+ziCwql29zIHD0PkBQ25fOlg/igBsUzakIjo6yVrbgWuzB
1mXWS0j+xVlOarbFCj68Fn7oyOn2a035UQU349HnWsJxU6tpguxK7w6x29oEHg7w
pi0zXdzCwklQ9f6q2FkljZmkKvMlOA==
=At5t
-----END PGP SIGNATURE-----

--abMiHA/nfhBxl0Pc--

